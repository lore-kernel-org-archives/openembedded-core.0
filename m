Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.16824.1621246796296257277
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 03:19:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=A+lYkbul;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id c14so3975577wrx.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 03:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=778JFSSaFOJcHQTPRKQoTrtjJxQsH53Jyg/fLvLoQyk=;
        b=A+lYkbulS4MIXDQGej4+zrpWYVQ7U8+/63bfixVhH8pWJAreHie/YLSsB16Fn1j7tP
         1lVw1W+WPYraxmKEbYtWQbgvYAdV+ybiscRXtdwhhBgDlVS9hr3EQYoZUCCP5LFNFN35
         zhlBTpeavn6G3ibYoDsbCeNt32lB1UJOlem38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=778JFSSaFOJcHQTPRKQoTrtjJxQsH53Jyg/fLvLoQyk=;
        b=dyOV4mzWPq334A/EF4J+cf5gI7MeFJ57MCF1pVmYy7ah2hRl85GjlqbEEDo2Q0A8Bc
         iqpc2sAhWuQBQZDDwOvT+WmIoZIO4xaC8pnyO5nCjPS1JWPhLfPdXw5fmN9VurY8cfkR
         Er0XbCWeZrvHQiSX/yXYk7YfHaLzH/vdleteozRKfDo5D6s82RkJpoOFJSJhLVtTm4sM
         79yADjO+H5u6Fsqxz+LNibDc/TRb5hiNJixnPB2oVfvSdqcrn1ZNNbuLKFcMCPEeaSdq
         hq16z48KxWexCTobypbvdYKpD9JbH2b9Ha40m4s1Pv2uCtTrfM+KLFMQCvcGAe2nmowX
         0NaA==
X-Gm-Message-State: AOAM531WxNpRbR+5lJI7qU4r0ISnlH0hpPZ9vN7L5Ed6VQI3U2k1Z8nD
	zkK1sTY9FI8THr4l+/wldf9v3Q==
X-Google-Smtp-Source: ABdhPJyWKfWpqOctKnn6LTDbGPysyGfIQWB8fVIRKmtqe/fTZrC8R9m1kQghQXdXo7+06Z3ax2VRJA==
X-Received: by 2002:a5d:56d0:: with SMTP id m16mr2209961wrw.163.1621246794490;
        Mon, 17 May 2021 03:19:54 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc? ([2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc])
        by smtp.gmail.com with ESMTPSA id r5sm11020570wrw.96.2021.05.17.03.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 03:19:54 -0700 (PDT)
Message-ID: <21f7614592aa6e657a0d2e940a29598c66d22b65.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cve-extra-exclusions.inc: add exclusion list for intractable CVE's
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Konrad Weihmann <kweihmann@outlook.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 17 May 2021 11:19:53 +0100
In-Reply-To: <AM9PR09MB464240F22D172EFD67A0D389A82D9@AM9PR09MB4642.eurprd09.prod.outlook.com>
References: <20210517091616.2414045-1-richard.purdie@linuxfoundation.org>
	 <AM9PR09MB464240F22D172EFD67A0D389A82D9@AM9PR09MB4642.eurprd09.prod.outlook.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-05-17 at 12:10 +0200, Konrad Weihmann wrote:
> 
> On 17.05.21 11:16, Richard Purdie wrote:
> > The preferred methods for CVE resolution are:
> > 
> > 1. Version upgrades where possible
> > 2. Patches where not possible
> > 3. Database updates where version info is incorrect
> > 4. Exclusion from checking where it is determined that the CVE
> >     does not apply to our environment
> > 
> > In some cases none of these methods are possible. For example the
> > CVE may be decades old with no apparent resolution, and with broken
> > links that make further research impractical. Some CVEs are vauge
> > with no specific action the project can take too.
> > 
> > This patch creates a mechanism for users to remove this type of
> > CVE from the cve-check results via an optional include file.
> > 
> > Based on an initial patch from Steve Sakoman <steve@sakoman.com>
> > but extended heavily by RP.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >   .../distro/include/cve-extra-exclusions.inc   | 91 +++++++++++++++++++
> >   1 file changed, 91 insertions(+)
> >   create mode 100644 meta/conf/distro/include/cve-extra-exclusions.inc
> > 
> > diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
> > new file mode 100644
> > index 00000000000..2d774f3706c
> > --- /dev/null
> > +++ b/meta/conf/distro/include/cve-extra-exclusions.inc
> > @@ -0,0 +1,91 @@
> > +# This file contains a list of CVE's where resolution has proven to be impractical
> > +# or there is no reasonable action the Yocto Project can take to resovle the issue.
> > +# It contains all the information we are aware of about an issue and analysis about
> > +# why we believe it can't be fixed/handled. Additional information is welcome through
> > +# patches to the file.
> > +#
> > +# Include this file in your local.conf or distro.conf to exclude these CVE's
> > +# from the cve-check results or add to the bitbake command with:
> > +#     -R meta/conf/distro/include/cve-extra-exclusions.inc
> > +#
> > +# The file is not included by default since users should review this data to ensure
> > +# it matches their expectations and ussage of the project.
> > +#
> > +# Wemay also include "in-flight" information about current/ongoing CVE work with
> > +# the aim of sharing that work and ensuring we don't duplicate it.
> > +#
> > +
> > +
> > +# strace https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0006
> > +# CVE is more than 20 years old with no resolution evident
> > +# broken links in CVE database references make resolution impractical
> > +CVE_CHECK_WHITELIST += "CVE-2000-0006"
> > +
> > +# epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2005-0238
> > +# The issue here is spoofing of domain names using characters from other character sets.
> > +# There has been much discussion amongst the epiphany and webkit developers and
> > +# whilst there are improvements about how domains are handled and displayed to the user
> > +# there is unlikely ever to be a single fix to webkit or epiphany which addresses this
> > +# problem. Whitelisted as there isn't any mitigation or fix or way to progress this further
> > +# we can seem to take.
> > +CVE_CHECK_WHITELIST += "CVE-2005-0238"
> > +
> > +# glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-4756
> > +# Issue is memory exhaustion via glob() calls, e.g. from within an ftp server
> > +# Best discussion in https://bugzilla.redhat.com/show_bug.cgi?id=681681
> > +# Upstream don't see it as a security issue, ftp servers shouldn't be passing
> > +# this to libc glob. Exclude as upstream have no plans to add BSD's GLOB_LIMIT or similar
> > +CVE_CHECK_WHITELIST += "CVE-2010-4756"
> > +
> > +# go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29509
> > +# go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29511
> > +# The encoding/xml package in go can potentially be used for security exploits if not used correctly
> > +# CVE applies to a netapp product as well as flagging a general issue. We don't ship anything
> > +# exposing this interface in an exploitable way
> > +CVE_CHECK_WHITELIST += "CVE-2020-29509 CVE-2020-29511"
> > +
> > +
> > +
> > +#### CPE update pending ####
> > +
> > +# groff:groff-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0803
> > +# Appears it was fixed in https://git.savannah.gnu.org/cgit/groff.git/commit/?id=07f95f1674217275ed4612f1dcaa95a88435c6a7
> > +# so from 1.17 onwards. Reported to the database for update by RP 2021/5/9. Update accepted 2021/5/10.
> > +#CVE_CHECK_WHITELIST += "CVE-2000-0803"
> > +
> > +# grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14865
> > +# Looks like grub-set-bootflag is patched in by Fedora/RHEL:
> > +# https://src.fedoraproject.org/rpms/grub2/blob/498ea7003b4dd8079fc075fad7e19e0b190d0f97/f/0133-Add-grub-set-bootflag-utility.patch
> > +# Does not exist in upstream grub2:
> > +# https://git.savannah.gnu.org/cgit/grub.git/tree/util
> > +# Reported to the database for update by RP 2021/5/9 Update accepted 2021/5/12
> > +#CVE_CHECK_WHITELIST += "CVE-2019-14865"
> > +
> > +# tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-4476 *
> > +# https://bugzilla.redhat.com/show_bug.cgi?id=280961 - issue affects paxutils included in tar
> > +# http://cvs.savannah.gnu.org/viewvc/paxutils/paxutils/paxlib/names.c?r1=1.2&r2=1.4 was the fix
> > +# included in tar 1.19 and later
> > +# CPE update sent, may or may not exclude for us
> > +#CVE_CHECK_WHITELIST += "CVE-2007-4476"
> > +
> > +
> > +
> > +#### Upstream still working on ####
> > +
> > +# qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255
> > +# There was a proposed patch https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg06098.html
> > +# however qemu maintainers are sure the patch is incorrect and should not be applied.
> > +
> > +# flex:flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293
> > +# Upstream bug, still open: https://github.com/westes/flex/issues/414
> > +# Causes memory exhaustion so potential DoS but no buffer overflow, low priority
> > +
> > +# wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879
> > +# https://mail.gnu.org/archive/html/bug-wget/2021-02/msg00002.html
> > +# No response upstream as of 2021/5/12
> 
> What is the use of that information? From my perspective an open 
> unresolved issue is an open unresolved issue - from a product 
> perspective it's not that important if upstream is working on it or not 
> - rather as the actual liable party I have to check myself, if my 
> product is affected in any way - and if not, whitelist it myself.
> 
> So how does this provide additional information, other than it's prone 
> to be outdated or prone to very frequent updates (which doesn't work 
> well, when doing only bumps from a point release to another)?

If you have a list of CVEs from the tool, each person seeing that list
currently has to go and look into each one of them. Even trying to find the 
correct link to find the status of a given issue can in some cases be a real pain.

My hope is that if people can see the status of the issues, we might actually
get some help in trying to fix the "open" ones.

I'm therefore experimenting a bit with some way to "share" the known
state of the open issues. I appreciate the file isn't ideal but it
could perhaps be better than the current state of knowing "nothing" and 
everyone working from scratch.

> Still I like the idea of this file, but it should be documented better 
> (section in the manual?)

I agree, we do need to document it. I would love help with that.

> IMHO it would be better to use this file just for the CVEs which will 
> not be fixed anytime soon, but not for things beyond that scope

It is better everyone look into open issues themselves and we don't share 
any "state"?

I do understand the viewpoint and from a personal/company standpoint it is
fine but I don't think it helps people collaborate on trying to reduce the
list of open issues. 

I am pretty sad/frustrated that these lists have been sent out in their current
form with many open CVEs for a long period and there are few who try and do
anything about them. It certainly doesn't make the project look good :(. I know
the reality is different with the majority being obsolete but the perception
is poor.

Cheers,

Richard

