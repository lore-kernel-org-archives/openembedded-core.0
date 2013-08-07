Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f176.google.com (mail-ve0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id DB5BD61013
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2013 14:34:27 +0000 (UTC)
Received: by mail-ve0-f176.google.com with SMTP id b10so1845600vea.21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Aug 2013 07:34:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=2R8U1BfrQQEOezUGwUZ2AW91JXFNGOnM+XipQ5RjxzM=;
	b=pgN7MwJWiOJ8N3t/cFPktdvL5Fmtfnann7etEKUu04nxsUqJm9tLGalxnsLplcVMZU
	DG1LmJqlk4JREiYzfj7yog7AMCQIzIE25RApaqToevW3//FQM1s2rpJDxPcBjSMcbIRB
	ncw62KLOEQKtQEBnYsuzuqc1+su2SV60o3W0FdVX/5syjkU0BJvQCAVzPAOULrjftmm7
	DDo5ZSEqcO7EXcStWxqTSLjPxn5z+Gc5aTK8k2/LTcD4WfKX/QivdzPl4aLqCXdzexTO
	SLUqIph8cdignDRtWD7mgy1xMpTuct60zwEUBxmWZdBvG7icUNjYdPcCauZ+f9lKTjAO
	H5uw==
X-Gm-Message-State: ALoCoQn7hS+gaQ4DWBhQqhwaG62m/Nu9AFwgD2wZOcBkdPMyifbj4Patg7JzbFjmy2hwT7OSbQG4
X-Received: by 10.58.233.8 with SMTP id ts8mr530768vec.44.1375886066784; Wed,
	07 Aug 2013 07:34:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Wed, 7 Aug 2013 07:34:06 -0700 (PDT)
In-Reply-To: <1375885075-13410-1-git-send-email-mranostay@gmail.com>
References: <1375885075-13410-1-git-send-email-mranostay@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 7 Aug 2013 15:34:06 +0100
Message-ID: <CAJTo0LYAgx=FdSGNMDL3u+yjuPBjmcy1U2zd+Ew5GC7225SKeQ@mail.gmail.com>
To: Matt Ranostay <mranostay@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] acpica: Add ACPICA package
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
X-List-Received-Date: Wed, 07 Aug 2013 14:34:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

On 7 August 2013 15:17, Matt Ranostay <mranostay@gmail.com> wrote:
> Added ACPICA package which enables viewing/editing/compiling
> of ACPI tables.

Is this really general-purpose enough to be suitable for oe-core, or
would it be more suited to meta-oe or some other layer?

> +PR =3D "r0"

Remove this line, r0 is the default.

+LIC_FILES_CHKSUM =3D
"file://${S}/source/include/aclocal.h;endline=3D42;md5=3D07fbd4e514c75e140a=
19e3ab508f763d"

${S} is default, so in general people do file://sources/...

> +SRC_URI =3D "https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.ta=
r.gz"

Fetching that here with wget produces:

ERROR: The certificate of =E2=80=98acpica.org=E2=80=99 is not trusted.

Someone should tell them...

> +inherit autotools

The recipe doesn't use autotools, so you should drop this inherit.

> +do_install() {
> +    oe_runmake INSTALLFLAGS=3D"-m 555"
> +}

That's just running 'make INSTALLFLAGS=3D"-m 555"'.  You'll need to tell
it to run the right target for install, and to pass ${D} somehow so
the makefile doesn't try and write to /usr directly.

Ross

