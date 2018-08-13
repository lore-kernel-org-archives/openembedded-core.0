Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7225C78F1A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 14:28:45 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id f21-v6so9078265wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 07:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=xaV+NzmKYFQbL2ftCQc8Pahj0xoo4RImL00MhOjp6Js=;
	b=ATLlo0QkoSl7xaoR7kZpBa3GCgKfNUPvHciLLXl9sS5l2PWIwd04oLWKTb56ToMMb3
	dgDq8RsRkao07o3OWps3Xz0Oi0XoIHt8LAOukLWIetM92Cwkc7YWdt/yfNxga8DDTJHE
	zVZE8ABLLB8NEdpZ9wtP9bGfFk/hUHtzoXc0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=xaV+NzmKYFQbL2ftCQc8Pahj0xoo4RImL00MhOjp6Js=;
	b=buV0XSBBW7FqXzVA5Ym3gBdwiKB95IetMiQr8q6nu/9n6IN+UslsQ618SJMg9p+T9u
	2lwlQiWMfZY+jlP+i7YYTLKsaX+HhPY3HqNWcaKWChXquJc1/3rVsgilh8uL5e6CtdFf
	8I48wLiDQDlXGSv6HEFnEyRzz5n/9WlsPCgBOZDP0Ii/sdBMNji/NBolcmWopDTdpynw
	iS8zywXUeOnN0sMiv6phEAp3SppPfWHxQ12NVApwOk5UmJkibW9i9N+AshjGp+YMs5uF
	u07SDZ+/odulNPeR3C7N89g0tGa0JISLAsFUDmOYtcTtdp1PXNhpZ/83CpBA7S5L/Yep
	jIOg==
X-Gm-Message-State: AOUpUlFewBufAtWkkQfXrAe59DtRW92SbZ0BYxN8CH70nNp++8wZIVNz
	wMuVPmRR8beMX140nSwDFdzJfJGvdFk=
X-Google-Smtp-Source: AA+uWPyoUryQqxFoJEUFhFCHq925OGYC4fXP+C8CCPgtPktHLvYbnRi57wM3FpzgR6gK0FIshLX3rA==
X-Received: by 2002:a1c:e189:: with SMTP id
	y131-v6mr8080375wmg.44.1534170525908; 
	Mon, 13 Aug 2018 07:28:45 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x7-v6sm13488254wrr.95.2018.08.13.07.28.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 07:28:44 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Aug 2018 15:28:35 +0100
Message-Id: <20180813142835.5309-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180813142835.5309-1-richard.purdie@linuxfoundation.org>
References: <20180813142835.5309-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 7/7] glibc: Fix locale archive path patch
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
X-List-Received-Date: Mon, 13 Aug 2018 14:28:45 -0000

The locale code uses the archive location in two places, ensure both are
corrected to use the environment variable which avoids nasty build
failures when archiving locales in images.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...-archive-uses-a-hard-coded-locale-pa.patch | 54 +++++++++++++++----
 1 file changed, 45 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc/0029-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch b/meta/recipes-core/glibc/glibc/0029-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
index aa3a9e26546..974fecdd569 100644
--- a/meta/recipes-core/glibc/glibc/0029-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
+++ b/meta/recipes-core/glibc/glibc/0029-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
@@ -18,11 +18,50 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  locale/programs/locarchive.c | 13 ++++++++-----
  1 file changed, 8 insertions(+), 5 deletions(-)
 
-diff --git a/locale/programs/locarchive.c b/locale/programs/locarchive.c
-index ca332a345f..6b7ba9b2e3 100644
---- a/locale/programs/locarchive.c
-+++ b/locale/programs/locarchive.c
-@@ -569,10 +569,13 @@ open_archive (struct locarhandle *ah, bool readonly)
+Index: git/locale/programs/locarchive.c
+===================================================================
+--- git.orig/locale/programs/locarchive.c
++++ git/locale/programs/locarchive.c
+@@ -340,12 +340,24 @@ enlarge_archive (struct locarhandle *ah,
+   struct namehashent *oldnamehashtab;
+   struct locarhandle new_ah;
+   size_t prefix_len = output_prefix ? strlen (output_prefix) : 0;
+-  char archivefname[prefix_len + sizeof (ARCHIVE_NAME)];
+-  char fname[prefix_len + sizeof (ARCHIVE_NAME) + sizeof (".XXXXXX") - 1];
++  char *archivefname;
++  char *fname;
++  char *envarchive = getenv("LOCALEARCHIVE");
+ 
+-  if (output_prefix)
+-    memcpy (archivefname, output_prefix, prefix_len);
+-  strcpy (archivefname + prefix_len, ARCHIVE_NAME);
++  if (envarchive != NULL) 
++    {
++      archivefname = xmalloc(strlen(envarchive));
++      fname = xmalloc(strlen(envarchive) + sizeof (".XXXXXX") - 1);
++      strcpy (archivefname, envarchive);
++    }
++  else
++    {
++      archivefname = xmalloc(prefix_len + sizeof (ARCHIVE_NAME));
++      fname = xmalloc(prefix_len + sizeof (ARCHIVE_NAME) + sizeof (".XXXXXX") - 1);
++      if (output_prefix)
++        memcpy (archivefname, output_prefix, prefix_len);
++      strcpy (archivefname + prefix_len, ARCHIVE_NAME);
++    }
+   strcpy (stpcpy (fname, archivefname), ".XXXXXX");
+ 
+   /* Not all of the old file has to be mapped.  Change this now this
+@@ -551,6 +563,8 @@ enlarge_archive (struct locarhandle *ah,
+ 
+   /* Add the information for the new one.  */
+   *ah = new_ah;
++  free(archivefname);
++  free(fname);
+ }
+ 
+ 
+@@ -569,10 +583,13 @@ open_archive (struct locarhandle *ah, bo
    /* If ah has a non-NULL fname open that otherwise open the default.  */
    if (archivefname == NULL)
      {
@@ -40,7 +79,7 @@ index ca332a345f..6b7ba9b2e3 100644
      }
  
    while (1)
-@@ -585,7 +588,7 @@ open_archive (struct locarhandle *ah, bool readonly)
+@@ -585,7 +602,7 @@ open_archive (struct locarhandle *ah, bo
  	     the default locale archive we ignore the failure and
  	     list an empty archive, otherwise we print an error
  	     and exit.  */
@@ -49,6 +88,3 @@ index ca332a345f..6b7ba9b2e3 100644
  	    {
  	      if (readonly)
  		{
--- 
-2.18.0
-
-- 
2.17.1


