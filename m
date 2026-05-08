Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CEE4CD342F
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:13:01 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8184.1778224371149030734
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=fX8DzIFm;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-452169ae568so1267367f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224369; x=1778829169; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cOYmxi2KvIyO76HrRhh1luc7DMLT1hvj1j/n+EMdIWY=;
        b=fX8DzIFmPlmfw3fsnxTVoaXHogZfzjXvdO56MTU0W3EyglabZwZcXYyoN0BxdwzbBE
         JPnNljpYld5xGDxhFgVf9M4S7oerR6h2HYLnAC4OpwPYHZHmzs1abSTnKvoGuMfgoa/N
         LDCF7+tjqqaYxXOXrcnQoIw0ti4zkLa/prl/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224369; x=1778829169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cOYmxi2KvIyO76HrRhh1luc7DMLT1hvj1j/n+EMdIWY=;
        b=PpTNCrPEmGEWPi296/Ivvs6TlEZHuSvK7X0Fu6WjOMbeU1+U6bxxHjS4QdCl6Refq2
         SQacnc/c5/tHH4XS0p0SLS6icPMllY4vKZdVCyCqtHVSb1jMI3MWF4ou6pPB4a/mIoii
         3r5aK7ll4C8h68n0eDzmrFNLSaNrqlChVy2ygWEBWMJRmE+vZuGUVekWUtfVFaGSX6P0
         io2XygTYXWFNjNpC7B7i7vQMCvXzlnOyvHHB5g5d1qGRZ1k9kLLyQ3VtmXGTUH4ieytv
         0z8MHiyP9ftyLbZXpRcbAsgx1sK1kF7PDemADHp2r3yoXiyCK8DW1HUQ97RE0S64Q69q
         UhaA==
X-Gm-Message-State: AOJu0YyGyL04GaxMJfYbgFJ0Co/cwQqi2VP6O9T5Zy5+pdU2/NRYE5Fx
	KVY8Kur1TRwk0r8NLcSBhuLH1jV2hy2S/6PEEgF373wwdwvT75T3xzqymnFJ9RAMp9Se5Pvlafa
	kuiR4MXs=
X-Gm-Gg: Acq92OFM6rxq1aSjfnLWh4APmNMEkw65tVofh0P/bfAuHw+tC8DfDEHWLyIjdboSzho
	NuvhtPwWwgFU+OXkFdCSr1aOrLIdeLNrt+lBNd2oMpi7ZrFXiq8JsmkNE58ms2NRDzdK9c+wF7F
	TTWKOY2NP6BakAtTHTceKGYHs5JL6789iiHwXOpFGRGJ45UEFchWVjpzAT0NEbzjfBIfzsCnGEW
	J9zTriAgni9WuOHsKHoFhsnUUktFFFrlpLhPJsUtrWfk9mzxyCBVIuNYRIeZmuEIfop8RTrvw2N
	ZyCegpsrHF/I7opLocpKUIQ6eGQPX3FdDE+vEEg0i8Ll+8ojkBqO8euwyEf/uGVpKg5RUhHE7R+
	ZLSyHYPMWHD1/Lc6WabXlpX/acnnVB3xalijCrSkOlppmVQNfyB3ZOzJfZdxBdJx95Ki7J1koM7
	K7BBTc/2VIoeJmG0kfo89C57YoUgkcj7nrqRpv+mkiE5yJWsrMHuOod8+kxBPxF8ESCuVwIb2GV
	rorG/zGWZH4CVfhBriU4OsR0k/sTA0Do57jTQ==
X-Received: by 2002:a5d:5d87:0:b0:43d:d037:d59c with SMTP id ffacd0b85a97d-4515b524224mr17875617f8f.16.1778224369199;
        Fri, 08 May 2026 00:12:49 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:48 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 51/52] devtool: Disable gpg signing when setting up source tree repos
Date: Fri,  8 May 2026 09:11:44 +0200
Message-ID: <338f6ba133dbf9e75c6155b37aca9abf79f806cf.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236693

From: Moritz Haase <Moritz.Haase@bmw.de>

This stops 'devtool modify foo' from failing with an error message like

    ERROR: Execution of 'git -c user.name=\"OpenEmbedded\" -c
    user.email=\"oe.patch@oe\" commit -q -m "Initial commit from upstream at
    version 1.90.0"' failed with exit code 128:
    error: cannot run ssh-keygen: No such file or directory
    error:
    fatal: failed to write commit object

when GPG signing is enabled in the git configuration.

(cherry picked from commit b5c84b07b87eafb4f68f7662b6cf26d8b73e3247)

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/lib/devtool/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index cb727f324f4..f47f57c465d 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -200,7 +200,7 @@ def setup_git_repo(repodir, version, devbranch, basetag='devtool-base', d=None):
         bb.process.run('git add -f -A .', cwd=repodir)
         commit_cmd = ['git']
         oe.patch.GitApplyTree.gitCommandUserOptions(commit_cmd, d=d)
-        commit_cmd += ['commit', '-q']
+        commit_cmd += ['commit', '-q', '--no-gpg-sign']
         stdout, _ = bb.process.run('git status --porcelain', cwd=repodir)
         if not stdout:
             commit_cmd.append('--allow-empty')

