Return-Path: <matt@madison.systems>
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 579FE77ACB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Oct 2017 11:18:16 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id o125so8395476lfe.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Oct 2017 04:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=W0ialYSjqzEMLwUy6TgF1EG/8kl8NBsszx3rxSb8Jlw=;
	b=ChBDMheWeHxXFn/YTmlr06FMkred5zsmKIyfHjB/7J1UhZIFF+A2yINu5MxHv35A6X
	1uOggSPKWha27rit9beddIhUGWaYjsrZZ7h6UYY1Lfnlh8bVopZxE488mEK6mGoEcxNA
	sN/H2tG2rjJtvsEnbCeKdaE2OoB4HoOD8iYOOI60jLOvfC+RhYSxboFYGlsoD4V6ULV6
	ntcnLCpJZa0x/rTaKjE3hVT1Z1c/bvWR03nitWB4HgANnF4E8Hm8oiD1AKNIenfQFGBY
	K7xk5Y/yYX+IgWsOlBvPjPxjOcuE3CdUlCMMqQ2wo3Xj3J2BtAtM8Cg3ZKXHZWHhugBt
	NL/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=W0ialYSjqzEMLwUy6TgF1EG/8kl8NBsszx3rxSb8Jlw=;
	b=VnD0SZdX84R6xtYp+o16VPKpnxzARX8IFWy1lgrlxxIxc4x+CQdeSzEAnp40GwW5k3
	k02JXMdxRjq+m8j6DYoL6e0vHzJcaz+LGAqgwaU2uz4+2xzE4F31ucTc1I4luOBM8qFD
	DtfD1pEzXzorfLqOhojoAAnOB2FraXi3Tn173ipec55GUIpVtlnIA23IeIGcnaIwFsZS
	GF9ZS8l2G47WbLO19nMPoqIHZ3+VyYAhtmELylJMBdd29Bo0NFcgkEe/53hTJsGlM/kL
	hdb1zS8YoH8JAdiR8+7aJIcRu3qDanJ5IpStj1XEtzeF5S+wvaXz61Qqrno3oOsOMFgg
	QW/g==
X-Gm-Message-State: AHPjjUgqJsqSFZuaEMc9Vqe+sY+hyX97xd8vvt1lWJZMXLxBd/pF/OjN
	lT1/MqoFHiMAZpgxcY1nPpL9Zw1X8Twg9sDdOfiRTg==
X-Google-Smtp-Source: AOwi7QDyN8v8NOQNP+OUhXCQUshxbLr0civzrEWekruq6iFNTk/F1zOoxAASV0h5+vvlFG+gXxtoiJM2W6OKE0WsAlc=
X-Received: by 10.46.1.100 with SMTP id 97mr9710097ljb.10.1507115897010; Wed,
	04 Oct 2017 04:18:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.192.4 with HTTP; Wed, 4 Oct 2017 04:18:16 -0700 (PDT)
In-Reply-To: <1507068152.7331.291.camel@intel.com>
References: <1506694551-4487-1-git-send-email-matt@madison.systems>
	<1507068152.7331.291.camel@intel.com>
From: Matt Madison <matt@madison.systems>
Date: Wed, 4 Oct 2017 04:18:16 -0700
Message-ID: <CAGgRHJoj=5aZEoLeYjbpd=-RiGFQHOV3rXBUykefdCBEi3Awvg@mail.gmail.com>
To: "Wold, Saul" <saul.wold@intel.com>
Cc: "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] go-runtime: prevent host leakage into target objects
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
X-List-Received-Date: Wed, 04 Oct 2017 11:18:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 3, 2017 at 3:02 PM, Wold, Saul <saul.wold@intel.com> wrote:
> On Fri, 2017-09-29 at 14:15 +0000, Matt Madison wrote:
>> When building for a target whose architecture matches
>> the build host's, the second pass through make.bash
>> to build the shareable runtime would also overwrite
>> the target's static cgo library with host-compatibile
>> binaries.
>>
>> Fix this by running the host-side build once and
>> target-only passes of make.bash twice, for static
>> and shareable.  This ensures that what gets installed
>> is target-compatible.
>>
>> [YOCTO #12136]
>>
> This does not appear to actually fix the bug mentioned here, I just
> found the failure again with intel-corei7-64 (from meta-intel) and then
> confirmed that it fails with qemux86-64 and genericx86-64 when using
> TCLIBC = "musl"
>
> Can you please verify and test with MUSL.

Hmm.  I had tested with MUSL before sending that patch, but I'll try
it again to see what I might have missed.

-Matt


>
> Thanks
>    Sau!
>
>
>> Signed-off-by: Matt Madison <matt@madison.systems>
>> ---
>>  meta/recipes-devtools/go/go-runtime.inc | 11 ++++++++---
>>  1 file changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-
>> devtools/go/go-runtime.inc
>> index 934d1aa..bd26e2e 100644
>> --- a/meta/recipes-devtools/go/go-runtime.inc
>> +++ b/meta/recipes-devtools/go/go-runtime.inc
>> @@ -23,9 +23,13 @@ do_compile() {
>>       rm -rf ${GOBIN} ${B}/pkg
>>       mkdir ${GOBIN}
>>       cd src
>> -     GO_FLAGS="" ./make.bash
>> +     ./make.bash --host-only
>> +     cp ${B}/pkg/tool/${BUILD_GOTUPLE}/go_bootstrap ${B}
>> +     rm -rf ${B}/pkg/${TARGET_GOTUPLE}
>> +     ./make.bash --target-only
>>       if [ -n "${GO_DYNLINK}" ]; then
>> -             GO_FLAGS="-buildmode=shared" GO_LDFLAGS="-extldflags
>> \"${LDFLAGS}\"" ./make.bash
>> +             cp ${B}/go_bootstrap ${B}/pkg/tool/${BUILD_GOTUPLE}
>> +             GO_FLAGS="-buildmode=shared" GO_LDFLAGS="-extldflags
>> \"${LDFLAGS}\"" ./make.bash --target-only
>>       fi
>>       cd ${B}
>>  }
>> @@ -41,8 +45,9 @@ do_install() {
>>       rm -rf ${D}${libdir}/go/pkg/obj
>>       rm -rf ${D}${libdir}/go/pkg/bootstrap
>>       find src -mindepth 1 -maxdepth 1 -type d | while read
>> srcdir; do
>> -             [ "$srcdir" = "./cmd" ] || cp --
>> preserve=mode,timestamps -R $srcdir ${D}${libdir}/go/src/
>> +             cp --preserve=mode,timestamps -R $srcdir
>> ${D}${libdir}/go/src/
>>       done
>> +     rm -f ${D}${libdir}/go/src/cmd/dist/dist
>>  }
>>
>>  # Remove test binaries that cannot be relocated
>> --
>> 2.7.4
>>

