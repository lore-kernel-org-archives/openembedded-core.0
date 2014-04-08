Return-Path: <fathi.boudra@linaro.org>
Received: from mail-bk0-f42.google.com (mail-bk0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1F8B960D67
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Apr 2014 17:16:22 +0000 (UTC)
Received: by mail-bk0-f42.google.com with SMTP id mx12so849710bkb.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Apr 2014 10:16:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=0qbJ0KIYVPkPECxUS9eSx22/ukhDEkCmblMonzPKXIU=;
	b=a3GsHi94+HntvM2OH+a+rTAfVjhbgAf+QqtzcbyDpCDhrJD9IHI2HGbsOeeZOtzISh
	miQ91RYO2F1t1rg/ZuFjebbRwxPyUak76THbDtCnyhicf5i/DSE7OA/BgxEDtehdcZE3
	dheU1kCxOCJVEI1pCg7mFEuum5DXc8P6XxDCPyzZGTWmN2J7q25ZHA54LaTd6cO0OG4V
	4YI5vNydAU3TKGstMz9Esje+dG/D/em8yqGXsROK+ljavT2/b8Hz1y1unm3skZ/IyUHG
	PL9avSmFUx+OgEDlUanf5WfaFOyU/LGhcWMysf+dAvtyOGIH6AMTfEO6+2RoDutoG/5s
	3FuA==
X-Gm-Message-State: ALoCoQkyY7AhswvNxIsk+shjdCue4Kg4/QLcxKR/0HiXcAhse1vA6R4xRJoSuN+IzsP54X2A5RB3
MIME-Version: 1.0
X-Received: by 10.152.18.170 with SMTP id x10mr519035lad.55.1396977382638;
	Tue, 08 Apr 2014 10:16:22 -0700 (PDT)
Received: by 10.112.145.229 with HTTP; Tue, 8 Apr 2014 10:16:22 -0700 (PDT)
In-Reply-To: <CAMKF1so-wo3wsD73dfbUEXYpCEMTxXgPBzqiKucCMVDYnFu+Sw@mail.gmail.com>
References: <1396965637-4802-1-git-send-email-fathi.boudra@linaro.org>
	<1396965637-4802-2-git-send-email-fathi.boudra@linaro.org>
	<CAMKF1so-wo3wsD73dfbUEXYpCEMTxXgPBzqiKucCMVDYnFu+Sw@mail.gmail.com>
Date: Tue, 8 Apr 2014 20:16:22 +0300
Message-ID: <CAGNsrLC-RbVJd+uD15XTto9oYFQHrWckBnoGWBjLZ+k6bLvcsQ@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 1/2] trace-cmd/kernelshark: update to 2.3.2 release (latest stable branch)
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
X-List-Received-Date: Tue, 08 Apr 2014 17:16:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 8 April 2014 20:05, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Apr 8, 2014 at 7:00 AM, Fathi Boudra <fathi.boudra@linaro.org> wrote:
>>  do_install() {
>> -       oe_runmake prefix="${prefix}" DESTDIR="${D}" install
>> +       ${MAKE} NO_PYTHON=1 prefix=${prefix} plugin_dir=${libdir}/trace-cmd/plugins DESTDIR=${D} install
>>  }
>
> can you explain/document this change

sure. trace-cmd doesn't have a build system generated Makefile. It's
hand written.
To do the install properly, one has to pass prefix/plugin_dir.
In addition, the previous command in the recipe doesn't do the right
thing anymore (you'll end with duplicated prefix /usr/usr/).

I've included NO_PYTHON since the build system is still broken for
cross-compilation in some way.
I found it acceptable because the old version available in oe doesn't
have this support anyway.

In short, I took some shortcut. The right thing to do is to revisit
upstream build system and fix it. Time that I can't afford right now.

