Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4A5FC5CFDB
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:54:53 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28838.1786654488148431992
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:54:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=KqEc1Pqr;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2026081320544457f6ad800c00020791-tiot4g@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2026081320544457f6ad800c00020791
        for <openembedded-core@lists.openembedded.org>;
        Thu, 13 Aug 2026 22:54:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=kx4ADdfvaJJJA2W999d4jXlQcbD6ByqBnC04jQxp12Y=;
 b=KqEc1Pqrgq8UWBi4UM2Myx/vtYXSHftuBFR8+10wOYONjxLU5lk7KxCWkIPIR46OUhpDSI
 Lrc9+GY0kSdJuzU1tV/kXdubTvaedRnH2fhSsyto5sCLBhulQZN6C9im02HiY0d93wcN/atQ
 IcRG05REUG6D6M5JplO+ZEq92J+WbGLSFwJmC2BawMWhe5pt3yKJSURlFyVjRSkzTgIxSWGl
 3Nkg4IkAVkOvEt4aqyCpQkeOJSjtfuUdGRA09sGdkXdBgunXIvV/MBZLJ6kM9yMir8llTbQ6
 zxzLOq5kVX7NQ7exm1b3FI5EFWilNXjQ/CPm91yFS+fK4yslj9FzkpXg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] openssh: upgrade 10.4p1 -> 10.5.p1
Date: Thu, 13 Aug 2026 22:54:23 +0200
Message-ID: <20260813205423.4001787-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 20:54:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243389

From: Peter Marko <peter.marko@siemens.com>

Handle CVE-2026-73281, CVE-2026-73282 and CVE-2026-73283.

Release notes [1]:

Potentially-incompatible changes
--------------------------------

 * Portable OpenSSH now requires ECC (Elliptic Curve Cryptography)
   support in libcrypto, including support for the NISTP521 curve.
   ECC is included in the default build configurations of all
   versions of all libcrypto implementations currently supported by
   OpenSSH, including LibreSSL, OpenSSL, BoringSSL and AWS LC.
   The --without-openssl build configuration is not affected.

Changes since OpenSSH 10.4
==========================

This release contains a number of security fixes and small bugfixes.

Security
========

 * ssh-agent(1): fix an interaction between agent locking and the
   session-bind@openssh.com extension that is used to identify
   forwarded agents. These binding requests were refused when the
   agent was locked, with the result that operations that were
   intended to be limited to local use only could be performed
   remotely, including the ability to add PKCS#11 tokens and make
   use of keys that had destination restrictions applied.
   Reported by sn0x-sharma

 * ssh(1): avoid potential realloc use-after-free in the client if a
   remote forwarding is added via the local session multiplexing
   socket while a remote forwarding open request is pending with the
   server. Report and fix from Brian Mingus of Cognatory

 * sshd(8): make the authorized_keys "restrict" keyword apply
   correctly to tunnel forwarding too (which is administratively
   disabled by default). Reported by Erichen, Institute of Computing
   Technology, Chinese Academy of Sciences

New features
------------

 * ssh-keygen(1): add ability to set or clear the touch-required and
   verify-required flags on FIDO private keys when resetting a
   private key's passphrase.

 * ssh(1): tweak ordering of certificates tried during pubkey
    authentication to prefer FIDO keys that do not require user
    presence (touch) first, and FIDO keys that require user
    verification via PIN or biometrics last. This effectively tries
    low-friction authenticators before higher friction ones.

 * ssh(1): add a "ssh -Z user@host" mode that prints the keys that
   will be tried for public key authentication in the order that
   they will be used.

 * sshd(8) use setproctitle(3) to identify sshd-session when its
   acting as a post-authentication monitor.

Bugfixes
--------

 * ssh-keyscan(1): make reading the server banner a non-blocking
   operation to prevent a stuck server from blocking a many-host
   keyscan from proceeding.

 * sshd(8): use sshpkt_fatal() instead of plain fatal() for errors
   in the packet code as this provides context of the failing peer
   (address, port, user, etc).

 * sshd(8): when signing hostkey proofs for a client UpdateHostKeys
   request, allow each hostkey to perform at most one signature
   operation.

 * sshd(8) fix GSSAPI option names, that were broken during a
   servconf.c refactoring in openssh-10.4; bz3974.

 * ssh-keygen(1): pass back errors from ed25519 key generation, which
   theoretically can fail. GHPR702.

 * sshd(8): move check of public key type against allowed algorithms
   to before parsing of the key sent by the peer. This removes at
   least some key parsing and verification paths from the pre-auth
   attack surface. Suggested by Christopher Paul Rohlf of Anthropic.

 * ssh-keygen(1): fix double frees (impossible to reach outside of a
   test harness), and also use freezero where possible. From
   Christopher Paul Rohlf at Anthropic.

 * sshd(8): fix ChannelTimeout and RekeyLimit not being applied in
   sshd_config Match blocks.

 * sshd(8): in sshd config dump mode, write all directives in mixed
   case for consistency

Portability
-----------

 * sshd(8): re-allow PAMServiceName inside a Match block, which
   was incorrectly disabled during a refactoring in openssh-10.4.
   bz3987

[1] https://www.openssh.org/txt/release-10.5

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../openssh/{openssh_10.4p1.bb => openssh_10.5p1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssh/{openssh_10.4p1.bb => openssh_10.5p1.bb} (99%)

diff --git a/meta/recipes-connectivity/openssh/openssh_10.4p1.bb b/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
similarity index 99%
rename from meta/recipes-connectivity/openssh/openssh_10.4p1.bb
rename to meta/recipes-connectivity/openssh/openssh_10.5p1.bb
index 96903bbc0c..e4b6ddef9d 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.4p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
@@ -25,7 +25,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://sshd_check_keys \
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            "
-SRC_URI[sha256sum] = "ef6026dd2aea8d56059638d5d3262902c892ceba9f88395835e0d06d3fb63238"
+SRC_URI[sha256sum] = "d44d28a839ea9daf969cc69150fde59910b2b39361dad81a3bd6cbd19218db11"
 
 CVE_STATUS[CVE-2007-2768] = "not-applicable-config: This CVE is specific to OpenSSH with the pam opie which we don't build/use here."
 

