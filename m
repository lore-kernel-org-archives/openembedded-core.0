Received: from mail6.pr.hu (mail6.pr.hu [87.242.0.6])
 by mx.groups.io with SMTP id smtpd.web11.23646.1629724506726390404
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 06:15:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=WmEhYDS7;
 spf=pass (domain: pr.hu, ip: 87.242.0.6, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1mI9n6-0003OZ-JT; Mon, 23 Aug 2021 15:15:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6EBzmaWpjMlN4HMvg5UV4sPi3eeOSBZoz9IcmEd/R3k=; b=WmEhYDS7IWZWJZkMHRkDHV75GL
	YEHOSESzwEQzpROf3un9TBnr+BbaJXv55YcgAvlyYaobz6yoBe/H/SkXs4szRyXEEc63KWcyN3/AX
	llkgwkFvAIU9gKFKXDaHq74CWsugC2egI9Ul7QzqbGOr9JxLXEG67E/D5QcHtHTUWK2jMuS85RuDS
	WPLmObDfBzysnXkgKx+ahG13St7cgB5A+jYFUMnw9mBL1ImACwoj8/nwjNy1WBz47ewe1d8A7zWJt
	bZT7KT9LfF6a2eYZHpyr4aWHHK+4BrK7dYQ0f8XKsOCGG4QX8LGgzSTd45rvzDLpSpLWYprmZl0kv
	6KQMnI4A==;
Received: from host-87-242-23-58.prtelecom.hu ([87.242.23.58] helo=localhost.localdomain)
	by mail.pr.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <zboszor@pr.hu>)
	id 1mI9n2-0006Kl-3o; Mon, 23 Aug 2021 15:15:02 +0200
Subject: Re: [OE-core] [PATCH 1/6] package_rpm.bbclass: Handle posttrans scriptlets
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, zboszor@gmail.com
References: <20210823122323.97400-1-zboszor@pr.hu>
 <20210823122323.97400-2-zboszor@pr.hu>
 <CANNYZj_VL-bxXG_mb-Z5QaWhHZvr4p+LVnvgODm84tRkSrFjEA@mail.gmail.com>
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
Message-ID: <fb092fdd-103a-9eb9-c070-b72313d45fdd@pr.hu>
Date: Mon, 23 Aug 2021 15:14:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj_VL-bxXG_mb-Z5QaWhHZvr4p+LVnvgODm84tRkSrFjEA@mail.gmail.com>
X-Spam-Score: -1.9 (-)
X-Scan-Signature: 48d6b0d972e1d5478b4282597e190fb4
X-Spam-Tracer: backend.mail.pr.hu -1.9 20210823131502Z
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

It's documented at www.rpm.org, Red Hat and SuSE.

https://docs.fedoraproject.org/en-US/packaging-guidelines/Scriptlets/
https://en.opensuse.org/openSUSE:Packaging_scriptlet_snippets
https://rpm-packaging-guide.github.io/

It's available since RPM 4.4. RPM 4.16.1.3 is in Hardknott.

A short Google search showed that *maybe* dpkg also supports it,
or at least there are(were?) plans to implement it:
https://wiki.debian.org/i18n/TranslationDebsProposals

With postinst, the time when the scriptlet runs may depend
on the order of the packages in the upgrade transaction and
may run with the older binaries in place.

The posttrans scriptlet runs at the very end of the
install/upgrade transaction, just like the OPKG "intercept"
scripts.

I successfully tested it long ago with a kernel upgrade
that was running dracut on the new version, plus a dracut
upgrade in the same session. Dissecting the initramfs proved
that with postinst, the old dracut version generated it,
while with posttrans, the new one did.

Who would want to use it? Anyone who needs some finalizer
script to be run at the end of an RPM/DNF transaction.

I started on Angstrom and I know opkg doesn't implement this
and Yocto inherited it. This patch is basically a heads up
that there's another way to do the same thing. Maybe opkg
implements this some day, maybe not. Anyway, Yocto in general
will need more changes before the main package.bbclass can
start to use it for all package formats.

Zoltán

2021. 08. 23. 14:34 keltezéssel, Alexander Kanavin írta:
> This needs to be better documented and tested.
> 
> What does this posttrans thing really do?
> Who would want to use it?
> Can there be examples?
> Can the Postinst test in meta/lib/oeqa/selftest/cases/runtime_test.py be extended to 
> regression-check that it works?
> 
> Alex
> 
> On Mon, 23 Aug 2021 at 14:23, Zoltan Boszormenyi via lists.openembedded.org 
> <http://lists.openembedded.org> <zboszor=pr.hu@lists.openembedded.org 
> <mailto:pr.hu@lists.openembedded.org>> wrote:
> 
>     From: Zoltán Böszörményi <zboszor@gmail.com <mailto:zboszor@gmail.com>>
> 
>     The "posttrans" scriptlet is the RPM equivalent of the
>     OPKG "intercept script" concept and probably a cleaner one.
> 
>     "pretrans" also exists in RPM but there's no equivalent
>     for it in OPKG.
> 
>     Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com <mailto:zboszor@gmail.com>>
>     ---
>       meta/classes/package_rpm.bbclass | 30 +++++++++++++++++++++---------
>       1 file changed, 21 insertions(+), 9 deletions(-)
> 
>     diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
>     index 88d861c0e7..5992d3fd06 100644
>     --- a/meta/classes/package_rpm.bbclass
>     +++ b/meta/classes/package_rpm.bbclass
>     @@ -308,10 +308,11 @@ python write_specfile () {
>           srcrconflicts  = ""
>           srcrobsoletes  = ""
> 
>     -    srcrpreinst  = []
>     -    srcrpostinst = []
>     -    srcrprerm    = []
>     -    srcrpostrm   = []
>     +    srcrpreinst   = []
>     +    srcrpostinst  = []
>     +    srcrprerm     = []
>     +    srcrpostrm    = []
>     +    srcrposttrans = []
> 
>           spec_preamble_top = []
>           spec_preamble_bottom = []
>     @@ -373,11 +374,11 @@ python write_specfile () {
>               splitrconflicts  = localdata.getVar('RCONFLICTS') or ""
>               splitrobsoletes  = ""
> 
>     -        splitrpreinst  = localdata.getVar('pkg_preinst')
>     -        splitrpostinst = localdata.getVar('pkg_postinst')
>     -        splitrprerm    = localdata.getVar('pkg_prerm')
>     -        splitrpostrm   = localdata.getVar('pkg_postrm')
>     -
>     +        splitrpreinst   = localdata.getVar('pkg_preinst')
>     +        splitrpostinst  = localdata.getVar('pkg_postinst')
>     +        splitrprerm     = localdata.getVar('pkg_prerm')
>     +        splitrpostrm    = localdata.getVar('pkg_postrm')
>     +        splitrposttrans = localdata.getVar('pkg_posttrans')
> 
>               if not perfiledeps:
>                   # Add in summary of per file dependencies
>     @@ -405,6 +406,7 @@ python write_specfile () {
>                   srcrpostinst   = splitrpostinst
>                   srcrprerm      = splitrprerm
>                   srcrpostrm     = splitrpostrm
>     +            srcrposttrans  = splitrposttrans
> 
>                   file_list = []
>                   walk_files(root, file_list, conffiles, dirfiles)
>     @@ -496,6 +498,11 @@ python write_specfile () {
>                   scriptvar = wrap_uninstall(splitrpostrm)
>                   spec_scriptlets_bottom.append(scriptvar)
>                   spec_scriptlets_bottom.append('')
>     +        if splitrposttrans:
>     +            spec_scriptlets_bottom.append('%%posttrans -n %s' % splitname)
>     +            spec_scriptlets_bottom.append('# %s - posttrans' % splitname)
>     +            spec_scriptlets_bottom.append(splitrposttrans)
>     +            spec_scriptlets_bottom.append('')
> 
>               # Now process files
>               file_list = []
>     @@ -590,6 +597,11 @@ python write_specfile () {
>               scriptvar = wrap_uninstall(srcrpostrm)
>               spec_scriptlets_top.append(scriptvar)
>               spec_scriptlets_top.append('')
>     +    if srcrposttrans:
>     +        spec_scriptlets_top.append('%posttrans')
>     +        spec_scriptlets_top.append('# %s - posttrans' % srcname)
>     +        spec_scriptlets_top.append(srcrposttrans)
>     +        spec_scriptlets_top.append('')
> 
>           # Write the SPEC file
>           specfile = open(outspecfile, 'w')
>     -- 
>     2.31.1
> 
> 
> 
> 
> 
> 
> 
> 

