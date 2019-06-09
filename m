Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id 56F6B7E57A
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Jun 2019 14:54:25 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id x15so3830339pfq.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Jun 2019 07:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Po+Yha8BZuG4GP0WGuyqY9I40rvp216Up57JVfY6/Wg=;
	b=TWTvwfBdAxhwP/8LBQEwMuOg//meCLwJ0fl2RYeGns8fA66PJp9IDnirws6eLXzsAr
	4Xb0T4vF/t5UGzL2Gwqw6SprHHfsWoOrLvW1yfnGjc+/xsYyfsR2K5BHE7ljsm019UR0
	pfUTIIT3u3WQhCqeXrqlYcC6DwzKPRk2SORKD6YoVUwsqlmB89WGwzwiMoZyt7XUruv6
	Aces1bwDJHZRfPaGn89zZmoi4jMXAtmoWH0WReHsiRg3p6WS8mjVvuhUENIKNVKXvVkW
	8sdlTNqfkzgYSoFaNZO7MIKAO4HJ5qkKHbfgQWWKvnD69vzBIpIDfM83Sjfd7xN7cefe
	DWkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Po+Yha8BZuG4GP0WGuyqY9I40rvp216Up57JVfY6/Wg=;
	b=sWiFy/VV0+5HjTzAFAalag/CqvAqjN9QPMVN8TKAeAyk0h4d4oovb99BRSkDMC8TGv
	9IS4v4YU49wbCPI57yOQeKuZhb3UZa2b4W1I4dEtHK6VyH/enJLEpU7qUoysUavPiqpr
	BybxEQIipSGa1ONcofukQClXHoRc6iXJrgmpME77Y2PiGbcTu5ko2I5dkv/HqeWs4GAI
	R6bsifwS3KYJ9OxUNbZKNtS9+R5DdbaO2cxc8Wf88KHrAuWwT6ZhiOIejJafT4c4ae/3
	d6QQp0L4YVurDlx9WMUDc7Uz9F8zhX+F9B56bo73NeP4ZqWrxpsLgif4yEvKtHf9IQJq
	PsVw==
X-Gm-Message-State: APjAAAWtlmTh1pNpB3yWl7qotUwAv50IKrOK0+9HyiABH38/yjbtOCVt
	+e6rQFpfEAxqwxbtceWamuUTTFJg
X-Google-Smtp-Source: APXvYqzqwi6qkiIzB0Cuv6mAGZ0R/edHbAFLPCZuIMDtJd1wi78oCRouFngwaEwE7+wcpbYUehqLsA==
X-Received: by 2002:a63:a055:: with SMTP id u21mr11886252pgn.5.1560092066477; 
	Sun, 09 Jun 2019 07:54:26 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:50d3:300:d9ff:2f1d])
	by smtp.gmail.com with ESMTPSA id d6sm7072188pgv.4.2019.06.09.07.54.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 09 Jun 2019 07:54:26 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Jun 2019 07:53:58 -0700
Message-Id: <e200ca4b86c880e530961b807ccd085795339fc6.1560091882.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560091882.git.akuster808@gmail.com>
References: <cover.1560091882.git.akuster808@gmail.com>
Subject: [Warrior-next 23/27] oeqa/utils/qemurunner: Set both the threadport&serverport with tcpserial parameter
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
X-List-Received-Date: Sun, 09 Jun 2019 14:54:25 -0000

From: Kevin Hao <kexin.hao@windriver.com>

After the commit ad522ea6a64e ("runqemu: Let qemuparams override default
settings"), the order of the two "-serial" parameters when running the
qemu have been switched. The effect of this is that the logging thread
will use ttyS1 (of course can't capture the kernel boot message anymore),
and the test command will run on the ttyS0. So the output of the test
command may be mangled by the kernel message (such as call trace), and
let the test command produce a fake timeout error message. We can't fix
it by just adjusting the order of the threadport and serverport, since
it will break some machines such as qemuarm64 which use the virtio
serial. So using the tcpserial to setup both the threadport and
serverport.

[YOCTO Bug 13309]

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index fd386ef..6d2860c 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -155,11 +155,11 @@ class QemuRunner:
         # and analyze descendents in order to determine it.
         if os.path.exists(self.qemu_pidfile):
             os.remove(self.qemu_pidfile)
-        self.qemuparams = 'bootparams="{0}" qemuparams="-serial tcp:127.0.0.1:{1} -pidfile {2}"'.format(bootparams, threadport, self.qemu_pidfile)
+        self.qemuparams = 'bootparams="{0}" qemuparams="-pidfile {1}"'.format(bootparams, self.qemu_pidfile)
         if qemuparams:
             self.qemuparams = self.qemuparams[:-1] + " " + qemuparams + " " + '\"'
 
-        launch_cmd += ' tcpserial=%s %s' % (self.serverport, self.qemuparams)
+        launch_cmd += ' tcpserial=%s:%s %s' % (threadport, self.serverport, self.qemuparams)
 
         self.origchldhandler = signal.getsignal(signal.SIGCHLD)
         signal.signal(signal.SIGCHLD, self.handleSIGCHLD)
-- 
2.7.4


