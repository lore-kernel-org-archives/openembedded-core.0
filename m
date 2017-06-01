Return-Path: <net147@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 61F30719B7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 12:15:11 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id d68so5718363ita.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Jun 2017 05:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=8fg1TvB+iBL9oRJAPMjfG4b/JVShYEJvL4wBloDZyT4=;
	b=CpeoOc7pM8hLrht3FtJmf5YWSp+qJlsdBQKkJ03LQb75huzz0Gj82JNdiULYtTjLgo
	fxcXUAYndRoyoTlLa0ta4oSbln+3ChSx9x7zSSqdZF9mfFXbp6C+PLYfSus4A/UnPJqH
	R4SIogv7Ex2elxDmUeQihjQ44L5jkYjvmf+H4cLFrT8SdbbneB3fysOAPn5UOc26W0RI
	pdFBxAt4pvSURjbFhGOYQCC+fmEfIdz4wi/GbpYwY+fI5Zgh9XOdUwjORz+G2YmgcCcn
	6AyOjI4MbckJH8s5TQCYdNl/jqmyakIy/Z+rlToS+qGQWGZ8ZIDVzYCc64sOu1vhgVbn
	MIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8fg1TvB+iBL9oRJAPMjfG4b/JVShYEJvL4wBloDZyT4=;
	b=FFnWopkWVdB0dknz3+8Wt7cGcb6X6kT/i7mNMPgVbTMymQ7wSGv5ssLjpfBcNK87Fd
	192oqoPHku7E4nkvwhvbk20jva//KeqD0WoFT1WAmkOnZFiohTuEisXW+biaNLB6hhzC
	4GkPWdnvO46T0fbh1/AMR7r+HZyZN4yPr2ptiEcONZ6MkaiJ1rKRgYjrn9wJXLJSK8cR
	i1Dmnu8PzddBR9plGtxhk+1iVURbCCMj5hGmJEgEGiyYk4wD6j6px/SZnrekMjdQ/yPK
	E58R1biV5H4J/CKWTu0SPR0cXVGxI163NxwC0MkS2HvUmTu0MbVNmYEJ/ouf3h6zrk3m
	9n6A==
X-Gm-Message-State: AODbwcAGvkRktbvGV5dRwpicikNGOcM4klvQte75RuenWShm0TEcIHEJ
	oESaXvMUmHwzEg==
X-Received: by 10.99.114.94 with SMTP id c30mr921579pgn.6.1496319313514;
	Thu, 01 Jun 2017 05:15:13 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	v9sm33576555pfa.43.2017.06.01.05.15.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Jun 2017 05:15:12 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Jun 2017 22:15:52 +1000
Message-Id: <20170601121552.27868-1-net147@gmail.com>
X-Mailer: git-send-email 2.12.2
Subject: [PATCH v2] bitbake.conf: Add sdl-config to HOSTTOOLS if using host SDL
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
X-List-Received-Date: Thu, 01 Jun 2017 12:15:12 -0000

If ASSUME_PROVIDES contains libsdl-native, we need to add sdl-config
to HOSTTOOLS to allow access to the host sdl-config.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/conf/bitbake.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8e4f4bbb56..3ad905c917 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -471,6 +471,9 @@ HOSTTOOLS += " \
 # Tools needed to run testimage runtime image testing
 HOSTTOOLS += "ip ping ps scp ssh stty"
 
+# Link to sdl-config if using host SDL
+HOSTTOOLS += "${@bb.utils.contains('ASSUME_PROVIDES', 'libsdl-native', 'sdl-config', '', d)}"
+
 # Link to these if present
 HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp socat sudo"
 
-- 
2.12.2


