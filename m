Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5C7D270EF1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 18:38:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7TIcL3i005382
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 11:38:21 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Fri, 29 Aug 2014 11:38:21 -0700
Message-ID: <5400C89C.6070901@windriver.com>
Date: Fri, 29 Aug 2014 13:38:20 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1409333994.29296.196.camel@ted>
In-Reply-To: <1409333994.29296.196.camel@ted>
Subject: Re: [PATCH] package_rpm: Add %manifest support for spec generation.
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
X-List-Received-Date: Fri, 29 Aug 2014 18:38:20 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/29/14, 12:39 PM, Richard Purdie wrote:
> From: Ronan Le Martret <ronan@fridu.net>
>
> The manifest file allow custom smack security for a package.
>      https://wiki.tizen.org/wiki/Security/Application_installation_and_Manifest

I'm concerned with this simply because we're adding a very specific (non-oe) 
mechanism into the mix.

I'd prefer if there was simple a "perform this generic action, which can add to 
the .spec file"

The during the packaging (before writing the .spec) we can call the action and 
it can insert the %manifest if appropriate.

That can then be distribution defined and work with any arbitrary mechanisms.

--Mark

> Signed-off-by: Ronan Le Martret <ronan@fridu.net>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index eecfcb2..0f565ac 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -389,6 +389,8 @@ python write_specfile () {
>               else:
>                   bb.note("Creating RPM package for %s" % splitname)
>                   spec_files_top.append('%files')
> +                if localdata.getVar('MANIFESTFILES', True):
> +                    spec_files_top.append('%%manifest %s' %  localdata.getVar('MANIFESTFILES', True))
>                   spec_files_top.append('%defattr(-,-,-,-)')
>                   if file_list:
>                       bb.note("Creating RPM package for %s" % splitname)
> @@ -495,6 +497,8 @@ python write_specfile () {
>               bb.note("Not creating empty RPM package for %s" % splitname)
>           else:
>               spec_files_bottom.append('%%files -n %s' % splitname)
> +            if localdata.getVar('MANIFESTFILES', True):
> +                spec_files_bottom.append('%%manifest %s' %  localdata.getVar('MANIFESTFILES', True))
>               spec_files_bottom.append('%defattr(-,-,-,-)')
>               if file_list:
>                   bb.note("Creating RPM package for %s" % splitname)
>
>


