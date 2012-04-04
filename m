Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <msm-fsl@mcclintock.net>) id 1SFUhF-0006wU-W5
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 20:12:42 +0200
Received: by mail-qc0-f175.google.com with SMTP id o7so334633qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Apr 2012 11:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mcclintock.net; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=46GHTlw3hq5rv2ry69T77V0OyoBlYIEmuqAeiO9pK3Q=;
	b=QL2WgmDRh5KMb63o66gEBOpEZaY3C/FhtL75479B/47ZOFYQeoPINqN3wv7pAaceJ9
	py85opuwJ3+AmTbDFzDmXf2hHmSakvVzyxVRhOiKrB1FvWScWTgeA8CDJUYTDk/VaPNO
	lRbeYSpt6DXH3KJFlVMn7Bghv8fPTJRTQ5XVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=46GHTlw3hq5rv2ry69T77V0OyoBlYIEmuqAeiO9pK3Q=;
	b=KFwc9/MN8WIaTrc3q29n4vxTtwjXHvHymRuLSidCYIaGfh6YAtCJPNJjAsYS2q0wVL
	21crNfFliIWyuFKzA7GXzPr29clunpSjy8qXBKAxWIa+n+jyqKj8r38et7bHu9zrTjGN
	mHyf8fTiwyaYEgRSPiaFb4mm/WTPBImGyHGhEThikCsz5QAj62LH8PBvst/ue586y0II
	g0bH073LwEMF7kYD3o2jCj2bRuGSOTw4TLoXr0CtNQX+115k+/bFHWgsQtgtUOOO0auA
	/pVgGxmhd342mGkL63kXqfe29EUQfGgXsq9xSexj4QgBJQ+u1ZYUloTk1aA+d5no/QO1
	Z8Pw==
Received: by 10.224.173.139 with SMTP id p11mr23972221qaz.14.1333562613323;
	Wed, 04 Apr 2012 11:03:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.11.234 with HTTP; Wed, 4 Apr 2012 11:03:09 -0700 (PDT)
In-Reply-To: <23c9e1f3a0ba5acbb54ae85cb194310020d3e80e.1333481624.git.mark.hatle@windriver.com>
References: <cover.1333481624.git.mark.hatle@windriver.com>
	<23c9e1f3a0ba5acbb54ae85cb194310020d3e80e.1333481624.git.mark.hatle@windriver.com>
From: Matthew McClintock <msm-fsl@mcclintock.net>
Date: Wed, 4 Apr 2012 11:03:09 -0700
Message-ID: <CAEsOVNcABe4RpUo2gO4s7_7eRGBDorXeCrP=kSt3Bb7gp92X1Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkOQK3GQ5rp81c6Y5dlQ/tuQMBlvpXx0YDjX6Jkg2vEgZX7E+MSJ6zqjW1MZFUOSZ5h8ZG8
Subject: Re: [PATCH 4/7] conf/machine/include: Cleanup PowerPC tunings to match README
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Apr 2012 18:12:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Apr 3, 2012 at 12:47 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> --- a/meta/conf/machine/include/tune-ppce500.inc
> +++ b/meta/conf/machine/include/tune-ppce500.inc
> @@ -4,13 +4,17 @@ require conf/machine/include/powerpc/arch-powerpc.inc
>
>  TUNEVALID[ppce500] = "Enable ppce500 specific processor optimizations"
>  TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500", "-mcpu=8540", "", d)}"
> -TUNE_PKGARCH_tune-ppce500 = "ppce500"
>
>  TUNEVALID[spe] = "Enable SPE ABI extensions"
> -TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "spe", "-mabi=spe -mspe -mfloat-gprs=double", "", d)}"
> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", [ "ppce500", "spe" ], "-mabi=spe -mspe -mfloat-gprs=single", "", d)}"
> +TARGET_FPU .= "${@bb.utils.contains("TUNE_FEATURES", [ "ppce500" , "spe" ], "ppc-efs", "", d)}"

Should these TARGET_FPU's be in a common file? Maybe some of these
other bits could be moved to a common file too? Setting this
TARGET_FPU above and TUNE_FEATURES in the same file seems redundant?
Or maybe this is for the multilib scenario and I'm missing
something...


