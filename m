Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1D107759D5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jun 2015 11:56:44 +0000 (UTC)
Received: by wgbhy7 with SMTP id hy7so139254379wgb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jun 2015 04:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=6vWXSTwo+R/aQbHN/3ysEi6zvuzC3e+ptld/ryOZwCo=;
	b=naGp5NBwo7iV8oBK7cuxt42mYdpxd6PECE66EyoF7LZqDwbSZ5ikFtbqFxYbLE/VoT
	0N9c+pmkIQUH2mreJiDSWHwCjXWhJTEoqRR29l5fXd5GXG6kEHmm2TzQeMBCZSeL2MwK
	2faakNTn7/D1RKO2oTyp8fbOmS2JFcw9iIiCyAC99MFJPyQJmpLaV/NqM3Z3Vz89xaek
	beUlCLI3IVA8aCj98M+BsqQIt+b1QbAqR1Qb6RljjFzgL12+kvzoHZFBrWh3Ehlh2KMc
	g0Zek+AW7I75UU3nrvRaqojm+O4PLLMFv4OohkZk99NLQS6AdnXVmav6VLNxoJ+luZ1/
	ndEg==
X-Received: by 10.194.185.106 with SMTP id fb10mr41365972wjc.84.1434974204075; 
	Mon, 22 Jun 2015 04:56:44 -0700 (PDT)
Received: from wsadrian.lan.ffah.ch (c-82-192-249-249.customer.ggaweb.ch.
	[82.192.249.249])
	by mx.google.com with ESMTPSA id q4sm30184358wju.14.2015.06.22.04.56.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Jun 2015 04:56:43 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jun 2015 13:56:06 +0200
Message-Id: <1434974169-19875-1-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
Cc: paul.eggleton@linux.intel.com,
	Adrian Freihofer <adrian.freihofer@gmail.com>
Subject: [PATCH 0/3] runqemu: support different net modes
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
X-List-Received-Date: Mon, 22 Jun 2015 11:56:50 -0000

runqemu runs qemu with one emulated NIC. The host is configured to work
as a NAT router for this emulated NIC. The virtual device is connected
to the Internet by default. This network mode is fine if a standalone
device needs to be developed and tested.
Today's M2M/IoT applications demand for devices with extended network
capabilities. To develop connectivity related features a bridged network
setup is much better suited than the supported NAT setup. A bridged setup
allows to virtualize the device under test/development as well as a reference
implementation of a cloud server. If the cloud server is part of the virtual
test setup ptests and image tests for connectivity verification are possible.

Tutorial to run a M2M test and development setup:
1. Prepare the host for the 192.168.7.x connection. The "tap0" device is for
   debugging purpose only. It is created by: "runquem-gen-tapdevs ... noinet"
2. Prepare the host for a second interface emulated by qemu. Setup a bridge
   and a tap device e.g. tap-inet0 which is connected to the bridge.
3. Run the virtual device with two emulated NICs:
   runqemu noinet ... qemuparams="-device virtio-net-pci,netdev=tap-inet0 ..."
4. Run another qemu instance and tap device for the reference cloud server.
5. Run a ptest to verify the connection between device and cloud server

This patch-set provides minimal changes to poky which are required to run a
setup as described above. These patches do not provide extended implementations
of runquem-gen-tapdevs, runqemu or a script to run a virtual reference server.
This still needs to be implemented by the user. However, with the patch-set the
user is enabled to do so without hacking in the poky folder.

Adrian Freihofer (3):
  connman: fix qemu config
  runqemu: add support for multiple NICs
  runqemu: support different net modes

 meta/recipes-connectivity/connman/connman-conf.bb  |  2 +-
 .../connman/connman-conf/qemuall/wired-setup       |  6 ++--
 scripts/runqemu                                    |  5 +++
 scripts/runqemu-gen-tapdevs                        | 11 ++++---
 scripts/runqemu-ifdown                             | 33 +++++++++++--------
 scripts/runqemu-ifup                               | 38 +++++++++++++---------
 scripts/runqemu-internal                           | 13 +++++---
 7 files changed, 68 insertions(+), 40 deletions(-)

-- 
2.4.3


