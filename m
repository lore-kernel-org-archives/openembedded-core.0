Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C3E0060897
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 14:04:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4LE4QTA024749
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 07:04:26 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Tue, 21 May 2013 07:04:26 -0700
Message-ID: <519B7EE9.3040202@windriver.com>
Date: Tue, 21 May 2013 09:04:25 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1369121731.11013.9.camel@ted>
In-Reply-To: <1369121731.11013.9.camel@ted>
Subject: Re: [PATCH] update-alternatives: Drop deprecated code, update to show error message
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 May 2013 14:04:26 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/21/13 2:35 AM, Richard Purdie wrote:
> This code has been deprecated for a while and confuses the class, lets drop it
> and just give the user hard error messages instead of the current warnings/fixups.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Excellent, it was always intended for a patch similar to this to go in 
'eventually'.. I'm happy for eventually to be now.

Acked-by: Mark Hatle <mark.hatle@windriver.com>

> ---
>   meta/classes/update-alternatives.bbclass | 95 +-------------------------------
>   1 file changed, 1 insertion(+), 94 deletions(-)
>
> diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
> index 2cadaf7..f75f5b6 100644
> --- a/meta/classes/update-alternatives.bbclass
> +++ b/meta/classes/update-alternatives.bbclass
> @@ -57,96 +57,12 @@
>   #
>   # The package priority for a specific target
>   # ALTERNATIVE_PRIORITY_<pkg>[name] = "priority"
> -#
> -#
> -# -----
> -#
> -#
> -# The following describes deprecated behavior, using any of the
> -# following modes will result in a warning, and eventually an error:
> -#
> -# There are two basic modes supported: 'single update' and 'batch update'
> -#
> -# 'single update' is used for a single alternative command, and you're
> -# expected to provide at least below keywords:
> -#
> -#     ALTERNATIVE_NAME - the name that the alternative is registered
> -#     ALTERNATIVE_PATH - the path of installed alternative
> -#
> -# ALTERNATIVE_PRIORITY and ALTERNATIVE_LINK are optional which have defaults
> -# in this class.
> -#
> -# 'batch update' is used if you have multiple alternatives to be updated.
> -# Unlike 'single update', 'batch update' in most times only require two
> -# parameters:
> -#
> -#     ALTERNATIVE_LINKS - a list of symbolic links for which you'd like to
> -#                         create alternatives, with space as delimiter, e.g:
> -#
> -#         ALTERNATIVE_LINKS = "${bindir}/cmd1 ${sbindir}/cmd2 ..."
> -#
> -#     ALTERNATIVE_PRIORITY - optional, applies to all
> -#
> -# To simplify the design, this class has the assumption that for a name
> -# listed in ALTERNATIVE_LINKS, say /path/cmd:
> -#
> -#     the name of the alternative would be: cmd
> -#     the path of installed alternative would be: /path/cmd.${BPN}
> -#     ${D}/path/cmd will be renamed to ${D}/path/cmd.{BPN} automatically
> -#     priority will be the same from ALTERNATIVE_PRIORITY
> -#
> -# If above assumption breaks your requirement, then you still need to use
> -# your own update-alternatives command directly.
>
> -# defaults
>   ALTERNATIVE_PRIORITY = "10"
>
> -# The following code is deprecated, but included for compatibility with older packages
> -def update_alternatives_after_parse(d):
> -    if bb.data.inherits_class('native', d) or bb.data.inherits_class('nativesdk', d):
> -        return
> -
> -    # The following code is deprecated, but included for compatibility with older packages
> -    pn = d.getVar('BPN', True)
> -
> -    if d.getVar('ALTERNATIVE_LINKS') != None:
> -        # Convert old format to new format...
> -        alt_links = d.getVar('ALTERNATIVE_LINKS', True) or ""
> -        for alt_link in alt_links.split():
> -            alt_name = os.path.basename(alt_link)
> -
> -            alternative = d.getVar('ALTERNATIVE_%s' % pn, True) or ""
> -            alternative += " " + alt_name
> -            d.setVar('ALTERNATIVE_%s' % pn, alternative)
> -            d.setVarFlag('ALTERNATIVE_LINK_NAME', alt_name, alt_link)
> -            d.setVarFlag('ALTERNATIVE_TARGET', alt_name, alt_link)
> -        return
> -
> -    if d.getVar('ALTERNATIVE_NAME') != None or d.getVar('ALTERNATIVE_PATH') != None:
> -        # Convert old format to new format...
> -        alt_name = d.getVar('ALTERNATIVE_NAME', True)
> -        alt_path = d.getVar('ALTERNATIVE_PATH', True)
> -        alt_link = d.getVar('ALTERNATIVE_LINK', True) or ("%s/%s" % (d.getVar('bindir', True), alt_name))
> -        if alt_name == None:
> -            raise bb.build.build.FuncFailed("%s inherits update-alternatives but doesn't set ALTERNATIVE_NAME" % d.getVar('FILE'))
> -        if alt_path == None:
> -            raise bb.build.build.FuncFailed("%s inherits update-alternatives but doesn't set ALTERNATIVE_PATH" % d.getVar('FILE'))
> -
> -        alternative = d.getVar('ALTERNATIVE_%s' % pn, True) or ""
> -        alternative += " " + alt_name
> -
> -        # Fix the alt_path if it's relative
> -        alt_path = os.path.join(os.path.dirname(alt_link), alt_path)
> -
> -        d.setVar('ALTERNATIVE_%s' % pn, alternative)
> -        d.setVarFlag('ALTERNATIVE_LINK_NAME', alt_name, alt_link)
> -        d.setVarFlag('ALTERNATIVE_TARGET', alt_name, alt_path)
> -
> -
>   # We need special processing for vardeps because it can not work on
>   # modified flag values.  So we agregate the flags into a new variable
>   # and include that vairable in the set.
> -
>   UPDALTVARS  = "ALTERNATIVE ALTERNATIVE_LINK_NAME ALTERNATIVE_TARGET ALTERNATIVE_PRIORITY"
>
>   def gen_updatealternativesvardeps(d):
> @@ -178,9 +94,6 @@ python __anonymous() {
>          bb.data.inherits_class('cross-canadian', d):
>           return
>
> -    # deprecated stuff...
> -    update_alternatives_after_parse(d)
> -
>       # compute special vardeps
>       gen_updatealternativesvardeps(d)
>
> @@ -202,9 +115,6 @@ def gen_updatealternativesvars(d):
>               ret.append(v + "_VARDEPS_" + p)
>       return " ".join(ret)
>
> -# First the deprecated items...
> -populate_packages[vardeps] += "ALTERNATIVE_LINKS ALTERNATIVE_NAME ALTERNATIVE_PATH"
> -
>   # Now the new stuff, we use a custom function to generate the right values
>   populate_packages[vardeps] += "${UPDALTVARS} ${@gen_updatealternativesvars(d)}"
>
> @@ -215,10 +125,7 @@ python perform_packagecopy_append () {
>       # Check for deprecated usage...
>       pn = d.getVar('BPN', True)
>       if d.getVar('ALTERNATIVE_LINKS', True) != None:
> -        bb.warn('%s: Use of ALTERNATIVE_LINKS is deprecated, see update-alternatives.bbclass for more info.' % pn)
> -
> -    if d.getVar('ALTERNATIVE_NAME', True) != None or d.getVar('ALTERNATIVE_PATH', True) != None:
> -        bb.warn('%s: Use of ALTERNATIVE_NAME is deprecated, see update-alternatives.bbclass for more info.' % pn)
> +        bb.fatal('%s: Use of ALTERNATIVE_LINKS/ALTERNATIVE_PATH/ALTERNATIVE_NAME is no longer supported, please convert to the updated syntax, see update-alternatives.bbclass for more info.' % pn)
>
>       # Do actual update alternatives processing
>       pkgdest = d.getVar('PKGD', True)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


