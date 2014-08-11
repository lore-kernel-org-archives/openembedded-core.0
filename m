Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f50.google.com (mail-yh0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id 8335F60DF7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 00:49:15 +0000 (UTC)
Received: by mail-yh0-f50.google.com with SMTP id v1so5841852yhn.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Aug 2014 17:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=bProTt/pTQ+hNpoRp12ENfsPhWh5FqaKC47ag+cKCIM=;
	b=njX2hQeGfhqhVAakq+zjvDAJfheBQ2iBcqb0h33TQTEnt25QyWUArf/3s32VhD0leK
	UblcW+TN/QYQWSJ/X4oSOISNmISpKJe+VrjARK5KLznULoRe92w5mXZ3YbQa7XUb1JWC
	HjeN978lsSJBlB5IBF0D2y+Z91LYtwAPOtD2iZ6ZOSU5ms/oiy8mDK1zoS9zXUpL+fhH
	JA0lVfyZg2UUJtaCcIFZK04XtkAZmy+QFuU2rfuDMsLe0Gndz2FqAQ7Ys1wFUHImSZqF
	AArWCxDZh3osIB+CXbZGhlT2doXTuZWFpMNOjn9rSi7CgjoZgnprmflKr0dHLJlETH/W
	nlvQ==
MIME-Version: 1.0
X-Received: by 10.236.148.112 with SMTP id u76mr38595915yhj.22.1407718156911; 
	Sun, 10 Aug 2014 17:49:16 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Sun, 10 Aug 2014 17:49:16 -0700 (PDT)
In-Reply-To: <1407425157-2736-1-git-send-email-marex@denx.de>
References: <1407425157-2736-1-git-send-email-marex@denx.de>
Date: Sun, 10 Aug 2014 21:49:16 -0300
X-Google-Sender-Auth: QfMcYoNQb_Ur_qKC9J8OXP7Cu0o
Message-ID: <CAP9ODKpCTJTLg2iwP+JmL+X_dyj919gB0k85r2HtKNKy_nhd_w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Marek Vasut <marex@denx.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 11 Aug 2014 00:49:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Marek,

On Thu, Aug 7, 2014 at 12:25 PM, Marek Vasut <marex@denx.de> wrote:
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
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Eric B=C3=A9nard <eric@eukrea.com>

I understand your problem however I don't think the solution you found
is optimal. It does fix the issue you refer in the commit log however
it also makes difficult for user to "reuse" default SDK flags to test
the application.

Please also when preparing commit logs please follow the guidelines[1].

1. http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

All your patches need to be adapted to follow those guidelines on the
commit messages. Please prepare a v2 for them.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

