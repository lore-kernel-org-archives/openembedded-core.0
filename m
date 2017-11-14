Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.193])
	by mail.openembedded.org (Postfix) with ESMTP id AB12160746
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 19:56:30 +0000 (UTC)
Received: from [216.82.241.196] by server-1.bemta-8.messagelabs.com id
	61/E9-01711-F6A4B0A5; Tue, 14 Nov 2017 19:56:31 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRWlGSWpSXmKPExsXi5LtOQDffizv
	KYMJXKYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePXsunsBV85Kn4vOMrYwNjB0cXIxSEksIpR
	4lvrHDYIZz2jxMIpT1i7GDk52AT0JCZfesLcxcjBIQJkX/0nChIWFvCT2PT0GAuIzSKgKvH0z
	QUmEJtXwEaiZXMPG4gtISAvsfj7TjCbU8BW4nPfFWYQWwio5tOEGSwQ9YISJ2c+AbOZBSQkDr
	54AVWjInFw6WVGmDmbNp9ln8DINwtJyywkLQsYmVYxahSnFpWlFukamuslFWWmZ5TkJmbm6Bo
	aWOjlphYXJ6an5iQmFesl5+duYgSGVT0DA+MOxg0fIw8xSnIwKYnyqnxmjxLiS8pPqcxILM6I
	LyrNSS0+xCjDwaEkwRviyR0lJFiUmp5akZaZAwxwmLQEB4+SCK8jSJq3uCAxtzgzHSJ1itGY4
	9nM1w3MHNOutjYxC7Hk5eelSonzqoGUCoCUZpTmwQ2CRd4lRlkpYV5GBgYGIZ6C1KLczBJU+V
	eM4hyMSsK8lSBTeDLzSuD2vQI6hQnoFCmQL3iLSxIRUlINjJN/iTsrBfntsHh3ilUpRXO5fc2
	+a5VGIrv2tk85ILK+pnjmTD/e36IpL/u3NdlMfLxeh6dAaefMg49msGvouHdqxizS2vC+2X5S
	4sIzN6O19FY8zD7D19hqkSIY8u9f5N1NEiZyH+y9S46VTzzAdeD4zIsu7RdrL4SpWW5RaylO/
	uJ0xZezT4mlOCPRUIu5qDgRAAzF7fm3AgAA
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-13.tower-46.messagelabs.com!1510689391!79943362!2
X-Originating-IP: [66.77.174.16]
X-StarScan-Received: 
X-StarScan-Version: 9.4.45; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25573 invoked from network); 14 Nov 2017 19:56:31 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
	by server-13.tower-46.messagelabs.com with SMTP;
	14 Nov 2017 19:56:31 -0000
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 14 Nov 2017 13:56:30 -0600
Received: from log-cln-jviguera.digi.com (10.101.2.54) by
	dor-sms-xch01.digi.com (10.49.8.99) with Microsoft SMTP Server (TLS) id
	14.3.361.1; Tue, 14 Nov 2017 20:56:28 +0100
From: Javier Viguera <javier.viguera@digi.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Nov 2017 20:56:18 +0100
Message-ID: <20171114195619.30923-2-javier.viguera@digi.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171114195619.30923-1-javier.viguera@digi.com>
References: <20171114195619.30923-1-javier.viguera@digi.com>
MIME-Version: 1.0
X-Originating-IP: [10.101.2.54]
Subject: [morty backport][PATCH 1/2] tcf-agent: kill with USR2 in systemd stop
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
X-List-Received-Date: Tue, 14 Nov 2017 19:56:30 -0000
Content-Type: text/plain

From: Martin Kelly <mkelly@xevo.com>

tcf-agent ignores SIGTERM, so upstream uses USR2 instead. This issue was noticed
by Jan Kiszka and Brian Avery around the same time:

https://patchwork.openembedded.org/patch/139546/
https://patchwork.openembedded.org/patch/139560/

However, these patches fixed only the init scripts, not the systemd service
file. This patch fixes the systemd file.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Javier Viguera <javier.viguera@digi.com>
---
 meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.service | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.service b/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.service
index fd9a6c4d565b..a486ac7bad63 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.service
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.service
@@ -5,6 +5,8 @@ After=network.target
 [Service]
 Type=forking
 ExecStart=@SBINDIR@/tcf-agent -d -L- -l0
+KillSignal=USR2
+SuccessExitStatus=USR2
 
 [Install]
 WantedBy=multi-user.target

