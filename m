Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com [136.143.188.16])
 by mx.groups.io with SMTP id smtpd.web08.10376.1616079783129377482
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Mar 2021 08:03:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=dwrobel@ertelnet.rybnik.pl header.s=ertelnet header.b=LR97Kpit;
 spf=pass (domain: ertelnet.rybnik.pl, ip: 136.143.188.16, mailfrom: dwrobel@ertelnet.rybnik.pl)
ARC-Seal: i=1; a=rsa-sha256; t=1616079775; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lUUb9CxjlZIFI5UAS981SLJfiyFflH7RngGxAxfm5J/5CEM2LL9x7JniKf5uhh2V3rFn1KiwHqxF3qDCQpkyWuYv7TYIRLAOZ69T6L4nLM4fZfWvl35ImXdSW1nNHsA/7ITjJdOFZCUCJdIdST6KVC2D37w2JqbzqKW8kunnmdg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1616079775; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=aNq76G3UPu5U5qhglAydEV78nA47tba8nDW3HiR+SCI=; 
	b=VgAjWaLoOCWfm31LyqpTnZWfa89H3PVZbXicLrrHZkakgw1M2UuEbMnP5Uyyq9Pge4r4PRzD+Qk0kZAHNYpZL09Z7EoJR5CdLqBHRpAlpKgwxeQ7SXKhU3kPGq1CUEE46/lcoKGospEnvAMQGuzeJlrp5Yha05p0X47MVA2Lb9k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ertelnet.rybnik.pl;
	spf=pass  smtp.mailfrom=dwrobel@ertelnet.rybnik.pl;
	dmarc=pass header.from=<dwrobel@ertelnet.rybnik.pl> header.from=<dwrobel@ertelnet.rybnik.pl>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1616079775;
	s=ertelnet; d=ertelnet.rybnik.pl; i=dwrobel@ertelnet.rybnik.pl;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=aNq76G3UPu5U5qhglAydEV78nA47tba8nDW3HiR+SCI=;
	b=LR97KpitkLMSMOUIlY7FaWEhDQZPQpfLEhVBja2qzaKXyCmjxWgXZzqAIvPz9bzm
	Bbh2PRmY4CMXN4az1aRjnyYKfkU9DheDmI8yTZni1CM6+vEUN7ndY1xX3zhLAlFRby6
	uufExm8WFc07kk2ccpQa3drH77NMvOLNUdAaA8m4=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1616079765950844.0971509102027; Thu, 18 Mar 2021 08:02:45 -0700 (PDT)
Date: Thu, 18 Mar 2021 16:02:45 +0100
From: "Damian Wrobel" <dwrobel@ertelnet.rybnik.pl>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Cc: "openembedded-core" <openembedded-core@lists.openembedded.org>
Message-ID: <17845dc3ffd.cbed61f719363.6674298828652258396@ertelnet.rybnik.pl>
In-Reply-To: <89c60143b0bc316c6eea953f9abef102c5b1f887.camel@linuxfoundation.org>
References: <17845b8040c.d366bfc510803.2986508994038431829@ertelnet.rybnik.pl> <89c60143b0bc316c6eea953f9abef102c5b1f887.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] base.bbclass: Honor PATH when selecting hosttools
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

 ---- On Thu, 18 Mar 2021 15:31:02 +0100 Richard Purdie <richard.purdie@linuxfoundation.org> wrote ----
 > On Thu, 2021-03-18 at 15:23 +0100, Damian Wrobel wrote:
 > > Honors the PATH[1] and other user settings like
 > > system wide ccache when selecting hosttools.
 > > 
 > > Fixes the following compilation error when compiling clang-11:
 > > 
 > >  | CMake Error at cmake/modules/CheckCompilerVersion.cmake:38 (message):
 > >  |   Host GCC version must be at least 5.1, your version is 4.8.5.
 > >  | Call Stack (most recent call first):
 > >  |   cmake/modules/CheckCompilerVersion.cmake:48 (check_compiler_version)
 > > 
 > > on CentOS which by default has the gcc 4.8.5. However, this machine
 > > has configured the gcc-7 from Developer Toolset[2] as a default one:
 > > 
 > >  $ gcc --version | head -n1
 > >  gcc (GCC) 7.3.1 20180303 (Red Hat 7.3.1-5)
 > > 
 > >  $ which gcc
 > >  /opt/rh/devtoolset-7/root/usr/bin/gcc
 > > 
 > > So far, I did not find any other software which would not respect
 > > this setup.
 > > 
 > > This will also start honoring system-wide ccache configuration
 > > (e.g. widely used on Fedora Linux) where the gcc is used from
 > > the non-standard following location:
 > > 
 > >  $ which gcc
 > >  /usr/lib64/ccache/gcc
 > > 
 > > once the user decided to install ccache package:
 > > 
 > >  $ rpm -qf /usr/lib64/ccache/gcc
 > >  ccache-4.2-1.fc33.x86_64
 > > 
 > > [1] https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_09_01_01
 > > [2] https://www.softwarecollections.org/en/scls/rhscl/devtoolset-7/
 > > 
 > > Signed-off-by: Damian Wrobel <dwrobel@ertelnet.rybnik.pl>
 > > ---
 > >  meta/classes/base.bbclass | 6 ------
 > >  1 file changed, 6 deletions(-)
 > > 
 > > diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
 > > index b4160402f0..67b0fa1497 100644
 > > --- a/meta/classes/base.bbclass
 > > +++ b/meta/classes/base.bbclass
 > > @@ -131,12 +131,6 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=True):
 > >              if os.path.islink(desttool):
 > >                  os.unlink(desttool)
 > >              srctool = bb.utils.which(path, tool, executable=True)
 > > -            # gcc/g++ may link to ccache on some hosts, e.g.,
 > > -            # /usr/local/bin/ccache/gcc -> /usr/bin/ccache, then which(gcc)
 > > -            # would return /usr/local/bin/ccache/gcc, but what we need is
 > > -            # /usr/bin/gcc, this code can check and fix that.
 > > -            if "ccache" in srctool:
 > > -                srctool = bb.utils.which(path, tool, executable=True, direction=1)
 > >              if srctool:
 > >                  os.symlink(srctool, desttool)
 > >              else:
 > 
 > This change simply removes a different change added to work around a different 
 > problem. Do we know the original issue is fixed and this can be removed? My
 > worry is that we end up with a cycle of sets of patches adding and removing 
 > this :(.
 > 
 > Cheers,
 > 
 > Richard
 > 

The original patch fa764a403da34bb0ca9fa3767a9e9dba8d685965 which 
introduced this functionality says: "base/bitbake.conf: Filter contents of PATH to only allow whitelisted tools"

So, I assuming that my patch should be fully aligned with it and in addition it will correctly honor the order of the directories in the PATH.

In the case where PATH is: 

PATH=/opt/rh/devtoolset-7/root/usr/bin:/usr/lib64/ccache:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/dwrobel1/.local/bin:/home/dwrobel1/bin

it will pick-up the gcc from the first entry "/opt/rh/devtoolset-7/root/usr/bin" which is what the user would have expected and configured the system for.

Regards,
Damian

