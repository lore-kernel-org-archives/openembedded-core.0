Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W0z-0004q6-QO
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:31:17 +0200
Received: by mail-iw0-f175.google.com with SMTP id 10so3431291iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=k/eUP4WhlN8+/9x7fiz22d2pSp7kGbzu6AyglnckJwQ=;
	b=g/AcC6T26IMdjCE4RPXTj5KJJVJXlsWAxjulPWHPav5V+UrZ9l6JSDvJwZ0ggSE2RF
	VM9QDIJ8xrJ7NFpxm9VcVzVlaEYlTusoLJWUIHpzq6E4+1CMDmJr+/oty3FhYoPFbh9N
	tEpV3NN+eJlH9RtDiAJ/dxGvlDVDnf1oyPMIk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=dH509HbMdwvNAcCr95lz37WYnR9fICAaO5u7//OwYmmv+/VNplgfEyuGwQtxtCUAW4
	vVwWtlnMHM30seqyQyKyHUhnEnIT5bMHjaik9QLEgHRtYgkCTz5xJtqZzy0iAHEvITJw
	uPr5n4cusAhs9LAlKwuGab23j1A1SCfSfiV0Y=
Received: by 10.43.46.194 with SMTP id up2mr1420612icb.124.1301632157625;
	Thu, 31 Mar 2011 21:29:17 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id he40sm1178956ibb.67.2011.03.31.21.29.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:29:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:29:08 -0700
Message-Id: <617974af705728499138fd7114ace5bbb3a256a3.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 19/46] libpam_1.1.3.bb: Fix compilation on uclibc when innetgr is absent
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Apr 2011 04:31:18 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../pam/libpam/pam-no-innetgr.patch                |   92 ++++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.1.3.bb          |    2 +
 2 files changed, 94 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-extended/pam/libpam/pam-no-innetgr.patch

diff --git a/meta/recipes-extended/pam/libpam/pam-no-innetgr.patch b/meta/recipes-extended/pam/libpam/pam-no-innetgr.patch
new file mode 100644
index 0000000..e622a0d
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/pam-no-innetgr.patch
@@ -0,0 +1,92 @@
+innetgr may not be there so make sure that when innetgr is not present
+then we inform about it and not use it.
+
+-Khem
+Index: Linux-PAM-1.1.3/modules/pam_group/pam_group.c
+===================================================================
+--- Linux-PAM-1.1.3.orig/modules/pam_group/pam_group.c
++++ Linux-PAM-1.1.3/modules/pam_group/pam_group.c
+@@ -659,7 +659,11 @@ static int check_account(pam_handle_t *p
+ 	}
+ 	/* If buffer starts with @, we are using netgroups */
+ 	if (buffer[0] == '@')
+-	  good &= innetgr (&buffer[1], NULL, user, NULL);
++#ifdef HAVE_INNETGR
++           good &= innetgr (&buffer[1], NULL, user, NULL);
++#else
++           pam_syslog (pamh, LOG_ERR, "pam_group does not have netgroup support");
++#endif
+ 	/* otherwise, if the buffer starts with %, it's a UNIX group */
+ 	else if (buffer[0] == '%')
+           good &= pam_modutil_user_in_group_nam_nam(pamh, user, &buffer[1]);
+Index: Linux-PAM-1.1.3/modules/pam_time/pam_time.c
+===================================================================
+--- Linux-PAM-1.1.3.orig/modules/pam_time/pam_time.c
++++ Linux-PAM-1.1.3/modules/pam_time/pam_time.c
+@@ -555,9 +555,13 @@ check_account(pam_handle_t *pamh, const
+ 	  }
+ 	  /* If buffer starts with @, we are using netgroups */
+ 	  if (buffer[0] == '@')
+-	    good &= innetgr (&buffer[1], NULL, user, NULL);
++#ifdef HAVE_INNETGR
++	       good &= innetgr (&buffer[1], NULL, user, NULL);
++#else
++	       pam_syslog (pamh, LOG_ERR, "pam_time does not have netgroup support");
++#endif
+ 	  else
+-	    good &= logic_field(pamh, user, buffer, count, is_same);
++	       good &= logic_field(pamh, user, buffer, count, is_same);
+ 	  D(("with user: %s", good ? "passes":"fails" ));
+ 
+ 	  /* here we get the time field */
+Index: Linux-PAM-1.1.3/modules/pam_succeed_if/pam_succeed_if.c
+===================================================================
+--- Linux-PAM-1.1.3.orig/modules/pam_succeed_if/pam_succeed_if.c
++++ Linux-PAM-1.1.3/modules/pam_succeed_if/pam_succeed_if.c
+@@ -231,18 +231,27 @@ evaluate_notingroup(pam_handle_t *pamh,
+ }
+ /* Return PAM_SUCCESS if the (host,user) is in the netgroup. */
+ static int
+-evaluate_innetgr(const char *host, const char *user, const char *group)
++evaluate_innetgr(const pam_handle_t* pamh, const char *host, const char *user, const char *group)
+ {
++#ifdef HAVE_INNETGR
+ 	if (innetgr(group, host, user, NULL) == 1)
+ 		return PAM_SUCCESS;
++#else
++        pam_syslog (pamh, LOG_ERR, "pam_succeed_if does not have netgroup support");
++#endif
++
+ 	return PAM_AUTH_ERR;
+ }
+ /* Return PAM_SUCCESS if the (host,user) is NOT in the netgroup. */
+ static int
+-evaluate_notinnetgr(const char *host, const char *user, const char *group)
++evaluate_notinnetgr(const pam_handle_t* pamh, const char *host, const char *user, const char *group)
+ {
++#ifdef HAVE_INNETGR
+ 	if (innetgr(group, host, user, NULL) == 0)
+ 		return PAM_SUCCESS;
++#else
++	pam_syslog (pamh, LOG_ERR, "pam_succeed_if does not have netgroup support");
++#endif
+ 	return PAM_AUTH_ERR;
+ }
+ 
+@@ -361,14 +370,14 @@ evaluate(pam_handle_t *pamh, int debug,
+ 		const void *rhost;
+ 		if (pam_get_item(pamh, PAM_RHOST, &rhost) != PAM_SUCCESS)
+ 			rhost = NULL;
+-		return evaluate_innetgr(rhost, user, right);
++		return evaluate_innetgr(pamh, rhost, user, right);
+ 	}
+ 	/* (Rhost, user) is not in this group. */
+ 	if (strcasecmp(qual, "notinnetgr") == 0) {
+ 		const void *rhost;
+ 		if (pam_get_item(pamh, PAM_RHOST, &rhost) != PAM_SUCCESS)
+ 			rhost = NULL;
+-		return evaluate_notinnetgr(rhost, user, right);
++		return evaluate_notinnetgr(pamh, rhost, user, right);
+ 	}
+ 	/* Fail closed. */
+ 	return PAM_SERVICE_ERR;
diff --git a/meta/recipes-extended/pam/libpam_1.1.3.bb b/meta/recipes-extended/pam/libpam_1.1.3.bb
index 9d6c317..b62e2f2 100644
--- a/meta/recipes-extended/pam/libpam_1.1.3.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.3.bb
@@ -19,6 +19,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/pam/library/Linux-PAM-${PV}.tar.bz2 \
            file://99_pam \
            file://pam.d/*"
 
+SRC_URI_append_libc-uclibc = " file://pam-no-innetgr.patch"
+
 SRC_URI[md5sum] = "6db7fcb5db6253350e3a4648ceac40e7"
 SRC_URI[sha256sum] = "17b268789b935a76e736a1150210dd12f156972973e79347668f828d43632652"
 
-- 
1.7.4.1



