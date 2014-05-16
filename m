Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f180.google.com (unknown [209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 853AA6028A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 10:34:28 +0000 (UTC)
Received: by mail-qc0-f180.google.com with SMTP id i17so3926157qcy.39
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 03:34:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=hzkL72t2pyRYdROuBZD4yhEXt9GVa4CuSYKabLdPMu4=;
	b=FpD7BJHcBInv8k/ofcR4PJyNHjNcGJjgGpq1w9Dq13YIGld0qgavqYPe4b/gu4q0U6
	E8Z7xAC0ejjuSmsHUiB/TuGIvUXFZWxvzp1AfkuUwUbM3UH5UatLQuYQ1tGvgvlWTjHq
	sMZnTyj2Pz+bvD19jtujgqv3Ql4TeE8XUyH961Ba6qOCEfWQpSOuX0U2/uhKTeSYLY1h
	Yccqa5xH61zEbBqI+6zFpcvFq60MkZighObvIg0agPHRtDJ14tQvzXE95SjRFUvUbALn
	ZH1IjgvkElqQGIyeUXdoy6zLefkyKaPeZevaMi996c6KSo68urbw7tNYSlG3PeATiQFt
	sk3A==
X-Gm-Message-State: ALoCoQnc5b/r8MKRYe3Ct8ELxxcuZQiq5XjlPQd4PqKkVsiOF7Qmk/rCskm1QXJc+EWebjaSYMGv
X-Received: by 10.140.109.70 with SMTP id k64mr22694716qgf.92.1400236469819;
	Fri, 16 May 2014 03:34:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Fri, 16 May 2014 03:34:09 -0700 (PDT)
In-Reply-To: <000501cf70f0$2f2d17a0$8d8746e0$@com>
References: <1400226321-5201-1-git-send-email-b40527@freescale.com>
	<CAJTo0Lar8Hbc1Gsa3k631M697ZHDOufJ1k7ugTUU=AWXaHjMAQ@mail.gmail.com>
	<000501cf70f0$2f2d17a0$8d8746e0$@com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 16 May 2014 11:34:09 +0100
Message-ID: <CAJTo0LavgOS4HyXLB2ur6PsH3yAaWW7SQf5qFcoz1yia_uMfqA@mail.gmail.com>
To: Zongchun YU <b40527@freescale.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] Add api-doc class
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
X-List-Received-Date: Fri, 16 May 2014 10:34:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 16 May 2014 11:18, Zongchun YU <b40527@freescale.com> wrote:
>>>Also I think this should be opt-in not forcibly enabled as not everyone =
would want API documentation to be generated.
> [Zongchun] Yes. it is opt-in. the source code of packages should be writt=
en follow the rules of doxygen. If not. doxygen will not generate docs.

It's not opt-in: once a recipe is using doxygen.bbclass then it has a
build dependency on doxygen-native and *will* generate documentation.
This is needless overhead if you don't intend to read the
documentation.


>>>Pretty sure you'll want to run doxygen after do_compile in case the docu=
mentation is generated from files built at compile time.  But don't most pa=
ckages that use doxygen invoke it themselves?  You're also not actually ins=
talling the documentation anywhere.
> [Zongchun] doxygen just use source code(follow the rules of doxygen) of p=
ackages to generate docs. not use files built at compile time. Some package=
s may just need to fetch and patch the source code and then generate docs. =
the configure file of doxygen have options to specify the generated docs ty=
pes and location. Whether install the docs may depend the packages.

You can't assert that the documentation is solely generated on the
shipped files in the tarballs: what if some of the files are
machine-generated?  Or if with for example DBus, the doxygen is
generated?

I've nothing against a doxygen class and would like to also see a
gtk-doc class that isn't a stub, with a single distribution-level
"generate API documentation" variable controlling them.  But the
documentation has to be generated at build time, and I think it's fair
to assume that is a package has API documentation then "make" will
build it, otherwise the method to build the documentation will be
different for every package.

For example, DBus has a Doxyfile.in at the top of the source tree, so
not only does configure needs to run to generate a Doxyfile but that
Doxyfile is written to ${B}, not ${S}.

Ross

