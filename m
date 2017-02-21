Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f46.google.com (mail-pg0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 71DCA72F18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 13:17:31 +0000 (UTC)
Received: by mail-pg0-f46.google.com with SMTP id 1so17713260pgi.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 05:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=0n8s+yeO80sehzQxPFRSVundamymraPzup+uc5vltBA=;
	b=bP8FZj4+zZpYv0bP9dQcxx7q+MSYMnY+tWmvAwiRfiiR3h5vOzrmSycHIWW5t1JtO/
	tnHEx+ojv+0RXhuoYmWUxGhnq+jMvpunr3Nvlb7g7NxfbEVoZsSwIrvlF1SPPuN4Dw6C
	nXuEoqn2iMJJgmKl0S26O0CK6qhTUCLcO0yt0PRUC9Vuk1E4QUNCtpIoG7i/gioW8lqk
	3SB0sljJx3C9qHvLutRW/2FhBDP8oyes6k/F+K8d4D/pzKlfWGtVcf6Hbq8azdOD5YF5
	+fnoKiY5TiAuyvM9IuIhyZZH4qLXBE1nOqZjG/F8AJKMHH82+Uv+F5Cf87NRVdEUQXrs
	VI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=0n8s+yeO80sehzQxPFRSVundamymraPzup+uc5vltBA=;
	b=UwEJeCH2lIMkjHHtMTjdkFCJjk2fMFEzH8rqzVUFrelGX5XK8OxR0OOzBsdk7jbXJZ
	zCkXOunJhnWySkYpj+UdGIGFV/ABZH9c+KqNQbsgaHz/VFFxHiGyandnmmBHIKJogYSl
	otgCogZn37OMz7ZsG0aj91EXZ0Y2tg+CctX5468/FcKQqyiOORMYIm9IVBPiLvGzNDBe
	6RwegLAms8MlCdYfCR3KSMeUPsSD+Km2lbqSoHbfexp7JcduBNKlgEK7qK5FCBXD3lkM
	bEVE/a+k7t/snQIWQDCveXeNSNl+Jz+6s2caqpRUlBGYasUz5DsQYSpIGN9jOBujP2qt
	nWXw==
X-Gm-Message-State: AMke39nJvZNKwUqLlmUFfOHRM0jx7V+lThoD6k2VpfKtlkQ2LukOucZ6b/h9OIZYEA/h9Q==
X-Received: by 10.84.224.197 with SMTP id k5mr10843619pln.15.1487683053260;
	Tue, 21 Feb 2017 05:17:33 -0800 (PST)
Received: from [127.0.1.1] (CPE-123-211-135-66.lnse3.woo.bigpond.net.au.
	[123.211.135.66]) by smtp.gmail.com with ESMTPSA id
	67sm41119015pfd.120.2017.02.21.05.17.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Feb 2017 05:17:32 -0800 (PST)
Date: Tue, 21 Feb 2017 23:17:28 +1000
Message-Id: <20170221131728.21595-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH v2 0/3] MinGW specific improvements/fixes
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
X-List-Received-Date: Tue, 21 Feb 2017 13:17:32 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

This series contains a few patches that improve/fix MinGW specific parts
that cannot be easily implemented outside of oe-core/meta.

The first patch disables update-alternatives when TARGET_OS == mingw32,
this is due to Windows not supporting symlinks in the same way as
expected by update-alternatives. This also avoids a dependency chain on
opkg-utils/python.

The second patch adds support to the package bbclass to detect shared
objects (.dll's) and executables use of shared objects. This
implementation allows for auto-detection of packages contents and their
dependencies and allows for the build to generate full sets of
executables with shared object dependencies when targeting mingw32.

The third patch fixes the libgpg-error configure task, preventing it
from clobbering the syscfg for mingw32 targets. This is not easily
overridden from a bbappend.
---
Changes in v2:
 * Rebased on top of current master


Nathan Rossi (3):
  update-alternatives.bbclass: Disable for mingw32 targets
  package.bbclass: Add SHLIB detection support for mingw targets
  libgpg-error: Don't replace the syscfg header for mingw32

 meta/classes/package.bbclass                        | 21 +++++++++++++++++++++
 meta/classes/update-alternatives.bbclass            |  4 ++++
 .../libgpg-error/libgpg-error_1.26.bb               | 11 ++++++++---
 3 files changed, 33 insertions(+), 3 deletions(-)

-- 
2.11.0

