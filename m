Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6500C6C4C8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 17:36:33 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id y139so3492927wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 09:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=h6gTxnefaU7/iRJ7zUGQVwHV0GZ/14satUSDeeomo/s=;
	b=FU8hm7imMSflbSXz+ZsDqU0xa7msqWzTP1BcPlnnomdjvthx8/x06r0RAHS4bzZsme
	9G3l9ztPVEqMR3EXJQ8hlAZcnHfhBQrUxIc7sWY/60/p2Cy3klFM316WXbOf/RZqlBIQ
	KKWV8k3vDXTEfNJ8scZ44F+ZuoBsmHJN3602E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=h6gTxnefaU7/iRJ7zUGQVwHV0GZ/14satUSDeeomo/s=;
	b=o2v4IQEbt574XSJ8gb/JbgTsSye15U5aKcNg/XZ7sHPe0FCSXepyfZMwkSGklXiCnX
	PgkON9u9GUHCq5YXFUbxqkxgdQfhHez+cicbi4w1KlOE4YNDINm4Xgv+ZwEmmbtw9nEV
	WvzfWUQIce1IC1KeMi9w/PB0LwFj/RppI38IYXyB9Tknp4VLUfVGZOai1VHFReUjW9wR
	DOj7KMufTjzSqM7mocXWMJIHmYZ3xkeC1ofLXDJ8yBsQJFY7G8bD6bawZ0tvf6dGP+pU
	4KJJtm6sczlyfiAPyhzOPEEWRoZTQNqh1zW4WYyKAZBWEOQRNkMdv0e7VAraJTD1iKRW
	MFZQ==
X-Gm-Message-State: AA+aEWbd4L1ZkrEsyoE/7vR/fNbpOkXGBEpzS9FQuDnWYKJQxNRLtM4/
	Z+PaO1mv/b4Ae3Na5OZkM07Tev73gmc=
X-Google-Smtp-Source: AFSGD/UHhYHOh14rKSekanFj89LDP0solNg1H0APNBXhV4u9doMZ0CZXp4dNpt6yDy87raOuBD+atQ==
X-Received: by 2002:a7b:cd97:: with SMTP id y23mr3452048wmj.129.1543426593996; 
	Wed, 28 Nov 2018 09:36:33 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a62sm1809943wmf.47.2018.11.28.09.36.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Nov 2018 09:36:33 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Nov 2018 17:36:31 +0000
Message-Id: <20181128173631.18288-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181128173631.18288-1-richard.purdie@linuxfoundation.org>
References: <20181128173631.18288-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/2] scripts/runqemu: Improve lockfile handling for python with close_fd=True
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
X-List-Received-Date: Wed, 28 Nov 2018 17:36:34 -0000

On python versions with close_fds=True (python 3.2 onwards), the tap
device lockfile isn't passed to the child process.

Since this guards against use of an active interface, we really want this
here, so pass it in pass_fds. This means if the parent exits early, the child
still holds the lock, avoiding messages like:

runqemu - ERROR - Failed to run qemu: qemu-system-x86_64: could not configure /dev/net/tun (tap0): Device or resource busy

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index d25de42f27d..b5afa5883aa 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1220,7 +1220,7 @@ class BaseConfig(object):
         cmd = "%s %s" % (self.qemu_opt, kernel_opts)
         cmds = shlex.split(cmd)
         logger.info('Running %s\n' % cmd)
-        process = subprocess.Popen(cmds, stderr=subprocess.PIPE)
+        process = subprocess.Popen(cmds, stderr=subprocess.PIPE, pass_fds=[self.lock_descriptor.fileno()])
         self.qemupid = process.pid
         retcode = process.wait()
         if retcode:
-- 
2.17.1


