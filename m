Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 4BACF6AC7B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 02:00:43 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id w10so21553648pde.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 19:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DdBnaajif0ydve7M9OYdzxfqsQ/+FTs/CvdKguBxzlQ=;
	b=X/CSsCnnlLXdHTNF19CeXJY9KFPfNoT2xf4WOHJylZ1UijUpVP1k3CiVV3XWoO9YfX
	3v9Gt3aB/wLbolPkLJIzOfLUFR6ETrTQuMUC3UmKhyh0lpYgfY6k6gI+W313HC1z8nA/
	iyLFI8pT+f2iULPVDhFXemg9kzupMiULuNIzR45t+zR4rnrRE6V3AA97voPVCtG+LV3K
	mEiBVzSxqj/t1KlScZDGDH6r2Bif6wLTp5p/DzpsTmyRElbg/3PgqGChHeDTepFamLIk
	uFliuigD3VCibvk2gjfYrXv5xKiQFHsYSG/hgZsiHpbB4lr4dxIbep/fnJOIITIOKmbL
	R5wQ==
X-Received: by 10.70.94.103 with SMTP id db7mr3482517pdb.122.1409018444841;
	Mon, 25 Aug 2014 19:00:44 -0700 (PDT)
Received: from haswell ([2601:9:3580:7a5:baca:3aff:fe80:aa8f])
	by mx.google.com with ESMTPSA id ct1sm1923030pdb.64.2014.08.25.19.00.43
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Aug 2014 19:00:44 -0700 (PDT)
Date: Mon, 25 Aug 2014 19:04:30 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Marek Vasut <marex@denx.de>
Message-ID: <20140826020430.GB18989@haswell>
References: <1407425157-2736-1-git-send-email-marex@denx.de>
MIME-Version: 1.0
In-Reply-To: <1407425157-2736-1-git-send-email-marex@denx.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Yocto: qt4: Let qmake control some compiler/linker flags
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
X-List-Received-Date: Tue, 26 Aug 2014 02:00:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 14-08-07 17:25:57, Marek Vasut wrote:
> In the case of building an Qt application outside of the Yocto
> build system, we want to make sure that a "debug" configuration
> of the application does contain debug symbols and is has the
> compiler optimalization unset. On the other hand, we want to
> have a "release" build which does not contain the debug symbols
> and has the compiler optimalization turned on.
> 
> The OE_QMAKE_* flags serve to pass all kinds of flags into the
> qmake-generated Makefile. Currently, we set OE_QMAKE_CFLAGS to
> be ${CFLAGS} and ditto for CXXFLAGS and LDFLAGS in the SDK
> toolchain environment script. This poses a problem, since the
> CFLAGS can contain optimization options (-O*) and even flags to
> produce debugging info (-g). The LDFLAGS may also contain some
> harmful flags.
> 
> The easy way out is to let qmake's army of configuration files
> handle the proper configuration of CFLAGS, CXXFLAGS and LDFLAGS
> for the generated Makefile and don't interfere with qmake's
> decisions by adding arbitrary flags. This patch completely
> scrubs OE_QMAKE_C{,XX}FLAGS and leaves only harmless flags in
> OE_QMAKE_LDFLAGS. With this patch, the behavior is as it is
> explained in the first paragraph.

This is fine if you see it from QT app developer POV, however I see a
downside, where we are then not compiling the application with the same
consistent set of flags which you would use with OE-mill when you
integrate the app back into OE build system. This reminds me of the
scenario where apps built with MSVS ended up shipping debug builds
because that was what developers tested on and there wasnt enough time
to fix release builds.

Having said that, I would prefer that you add -g flag to whatever you
are getting from SDK and debug using that ( which will be -g -O2)
in most cases optimized code debugging works well with modern gcc if it
does not we can always complain to gcc community.

IMHO its better to debug the code that you will ship. It saves a lot of
time as various steps of code life cycle.

-Khem


