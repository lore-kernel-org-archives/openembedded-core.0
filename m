Received: from mail-ia0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TOjmP-0004c4-K0
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 08:40:29 +0200
Received: by mail-ia0-f175.google.com with SMTP id b35so6025533iac.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2012 23:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=u/NTndGABFBkOH1xRR2eU9C1q+UdKGZJyPCOcmLtAik=;
	b=ynQV/1VtPbhsN870MtfjWtaeXiRb6bV5n5KsnFt4DvupYVrBAMp9zXb5UEfmZuA8KF
	K85aqym1XfdRYLS9UJxZVqwFsTEoE+VPiIM9YC3C3RT+hOzX0Ge06B+XNXkrFynmPvtT
	WINYFo8tVwCHT84QBFTfQhNkAqPAwJ5F25XYMjsMU5+5llja7Yc8A+NwABgyROp0jGZG
	KNoMEC9td4XYk0H3Uo8ZJ+eRXmt5OKcKKKQAD2LI5d1iin/FxROR4LaQfGvL6uTC0Gt5
	nfjHspy1Er1IPZMyi6BbwANIiFASra9GgGF+0bZpYG2fwQKTVYoMGN5CN8BKX0fULrLz
	t8Ow==
MIME-Version: 1.0
Received: by 10.43.7.132 with SMTP id oo4mr16401574icb.6.1350541630034; Wed,
	17 Oct 2012 23:27:10 -0700 (PDT)
Received: by 10.64.24.179 with HTTP; Wed, 17 Oct 2012 23:27:10 -0700 (PDT)
In-Reply-To: <1350490553.2185.117.camel@ted>
References: <1350487497-13102-1-git-send-email-s.stirtzel@googlemail.com>
	<1350490553.2185.117.camel@ted>
Date: Thu, 18 Oct 2012 08:27:10 +0200
Message-ID: <CAGiJk9dnd6mdFV+UhFHXaRjg4WMK9V2V11jc34PeUbu8kVSi-Q@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/2] gtk-immodules-cache: Add initial class to update gtk inputmethod module cache
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Oct 2012 06:40:30 -0000
Content-Type: text/plain; charset=UTF-8

2012/10/17 Richard Purdie <richard.purdie@linuxfoundation.org>:
> On Wed, 2012-10-17 at 17:24 +0200, Samuel Stirtzel wrote:
>> This is used by:
>> openembedded-core/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
>> meta-openembedded/meta-oe/recipes-support/maliit/maliit-framework_git.bb
>>
>> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
>> ---
>>  meta/classes/gtk-immodules-cache.bbclass |   70 ++++++++++++++++++++++++++++++
>>  1 file changed, 70 insertions(+)
>>  create mode 100644 meta/classes/gtk-immodules-cache.bbclass
>>
>> diff --git a/meta/classes/gtk-immodules-cache.bbclass b/meta/classes/gtk-immodules-cache.bbclass
>> new file mode 100644
>> index 0000000..833eefe
>> --- /dev/null
>> +++ b/meta/classes/gtk-immodules-cache.bbclass
>> @@ -0,0 +1,70 @@
>> +# This class will update the inputmethod module cache for virtual keyboards
>> +#
>> +# Usage: Set GTKIMMODULES_PACKAGES to the packages that needs to update the inputmethod modules
>> +
>> +gtk_immodule_cache_postinst() {
>> +if [ "x$D" != "x" ]; then
>> +    exit 1
>> +fi
>> +if [ ! -z `which gtk-query-immodules-2.0` ]; then
>> +    gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules
>> +fi
>> +if [ ! -z `which gtk-query-immodules-3.0` ]; then
>> +    gtk-query-immodules-3.0 > /etc/gtk-3.0/gtk.immodules
>> +fi
>> +}
>> +
>> +gtk_immodule_cache_postrm() {
>> +if [ "x$D" != "x" ]; then
>> +    exit 1
>> +fi
>> +if [ ! -z `which gtk-query-immodules-2.0` ]; then
>> +    gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules
>> +fi
>> +if [ ! -z `which gtk-query-immodules-3.0` ]; then
>> +    gtk-query-immodules-3.0 > /etc/gtk-3.0/gtk.immodules
>> +fi
>> +}
>> +
>> +python populate_packages_append () {
>> +    gtkimmodules_pkgs = d.getVar('GTKIMMODULES_PACKAGES', True).split()
>> +
>> +    for pkg in gtkimmodules_pkgs:
>> +            bb.note("adding gtk-immodule-cache postinst and postrm scripts to %s" % pkg)
>> +
>> +            postinst = d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar('pkg_postinst', True)
>> +            if not postinst:
>> +                postinst = '#!/bin/sh\n'
>> +            postinst += d.getVar('gtk_immodule_cache_postinst', True)
>> +            d.setVar('pkg_postinst_%s' % pkg, postinst)
>> +
>> +            postrm = d.getVar('pkg_postrm_%s' % pkg, True) or d.getVar('pkg_postrm', True)
>> +            if not postrm:
>> +                postrm = '#!/bin/sh\n'
>> +            postrm += d.getVar('gtk_immodule_cache_postrm', True)
>> +            d.setVar('pkg_postrm_%s' % pkg, postrm)
>> +}
>> +
>> +def gtkimmodules_after_parse(d):
>> +    def gtkimmodules_check_vars():
>> +        if d.getVar('BB_WORKERCONTEXT', True) is not None:
>> +            return
>> +
>> +        bb_filename = d.getVar('FILE')
>> +        packages = d.getVar('PACKAGES', True)
>> +
>> +        # check gtk-immodules package
>> +        gtkimmodules_check = d.getVar('GTKIMMODULES_PACKAGES', True) or ""
>> +        if gtkimmodules_check == "":
>> +            raise bb.build.FuncFailed, "\n\n\nERROR: %s inherits gtk-immodule-cache but doesn't set GTKIMMODULES_PACKAGE" % bb_filename
>> +
>> +    bpn = d.getVar('BPN', 1)
>> +    if bpn + "-native" != d.getVar('PN', 1) and \
>> +            bpn + "-cross" != d.getVar('PN', 1) and \
>> +            bpn + "-nativesdk" != d.getVar('PN', 1):
>> +        gtkimmodules_check_vars()
>> +
>> +python __anonymous() {
>> +    gtkimmodules_after_parse(d)
>> +}
>> +
>
> Sorry, but the after_parse code above is horrible. How about something
> more simple like:
>
> python __anonymous() {
>     if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):
>         gtkimmodules_check = d.getVar('GTKIMMODULES_PACKAGES')
>         if not gtkimmodules_check:
>             bb_filename = d.getVar('FILE')
>             raise bb.build.FuncFailed, "\n\n\nERROR: %s inherits gtk-immodule-cache but doesn't set GTKIMMODULES_PACKAGE" % bb_filename
> }

Well this looks better, I'll send a v3.

>
> I'd like to know where you got the inspiration for the original as I'd
> like to simplify that too!
>

It was original from systemd.bbclass:
https://github.com/openembedded/meta-oe/blob/master/meta-systemd/classes/systemd.bbclass


A quick grep shows this is used on some other classes:

meta-kde/classes/kde_exports.bbclass:def kde_exports_after_parse(d):
meta-openembedded/meta-systemd/classes/systemd.bbclass:def
systemd_after_parse(d):
openembedded-core/meta/classes/update-alternatives.bbclass:def
update_alternatives_after_parse(d):
openembedded-core/meta/classes/update-rc.d.bbclass:def update_rc_after_parse(d):
openembedded-core/meta/classes/gtk-immodules-cache.bbclass:def
gtkimmodules_after_parse(d):
openembedded-core/meta/classes/useradd.bbclass:def
update_useradd_after_parse(d):


For meta-kde and gtk-immodules-cache I can change this to your
suggestion, maybe the others need some work too?

-- 
Regards
Samuel


