Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2249.1792709333561021653
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 15:48:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=VWq5IB2K;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20261022224851bcf25f8e8300020732-rvaa3p@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20261022224851bcf25f8e8300020732
        for <openembedded-core@lists.openembedded.org>;
        Fri, 23 Oct 2026 00:48:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=yCLGE6IoO8plch1L5S+thnqZ3vR8A9IATlQ8JMfirK4=;
 b=VWq5IB2KJS+jtofQ/PM4IymUl9XoKHiigZest/bCCbVKDGTdskTf3imguG9TDm76iu4o2X
 FG+oxd2mqGW0YOrxLpLlA8uAJB20nCYmKYAASy6zr+RKHwkQsTowGT8VpPGx/8Yhsy3MUJLr
 9cWuvEzYd3QwiP8XebsxhHVe6GYjLryVlmgvJcS44LBsPySLZT2O503P3ZA4aXuen9dgJ/bv
 Fhnx/RPAw2N0h2DjDTt9Ogib9MATf8p8l21605WskMc35FWPGoVF7aVSFCg8i7mB91IkFPgu
 xzIbpWXF8ZWTDKeJA6Qo3tavTpQVfdbpy0JorAOy0nVEvIz/afBds5hQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH 13/15] glibc: patch CVE-2026-89092
Date: Fri, 23 Oct 2026 00:47:06 +0200
Message-ID: <20261022224711.3783258-13-peter.marko@siemens.com>
In-Reply-To: <20261022224711.3783258-1-peter.marko@siemens.com>
References: <20261022224711.3783258-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 22:49:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248468
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE from 3.41 branch (oldest release
still receiving security updates).

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../glibc/glibc/0047-CVE-2026-89092.patch     | 245 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |   1 +
 2 files changed, 246 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0047-CVE-2026-89092.patch

diff --git a/meta/recipes-core/glibc/glibc/0047-CVE-2026-89092.patch b/meta/recipes-core/glibc/glibc/0047-CVE-2026-89092.patch
new file mode 100644
index 00000000000..8df9dc904e4
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0047-CVE-2026-89092.patch
@@ -0,0 +1,245 @@
+From fa3ea0362354af7370abb5fe8c6f31a32a73af8e Mon Sep 17 00:00:00 2001
+From: DJ Delorie <dj@redhat.com>
+Date: Mon, 28 Sep 2026 14:27:16 +0200
+Subject: [PATCH] CVE-2026-89092: nscd: replace alloca with malloc in aicache,
+ hstcache
+
+This changes the alloca fallback to a malloc fallback
+in the addrinfo and host cache code.
+
+This fixes bug 34624.
+
+Co-authored-by: Florian Weimer <fweimer@redhat.com>
+Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+(cherry picked from commit cbf59b836645b6ac69ad8c47a560598bc4942ecc)
+
+CVE: CVE-2026-89092
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=fa3ea0362354af7370abb5fe8c6f31a32a73af8e]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ nscd/aicache.c  | 27 ++++++++++++++++++---------
+ nscd/hstcache.c | 47 ++++++++++++++++++++++++++++++++++-------------
+ 2 files changed, 52 insertions(+), 22 deletions(-)
+
+diff --git a/nscd/aicache.c b/nscd/aicache.c
+index 6f47236627..1ac86b86d8 100644
+--- a/nscd/aicache.c
++++ b/nscd/aicache.c
+@@ -93,7 +93,9 @@ addhstaiX (struct database_dyn *db, int fd, request_header *req,
+   int32_t ttl = INT32_MAX;
+   ssize_t total = 0;
+   char *key_copy = NULL;
+-  bool alloca_used = false;
++  /* If not NULL, dataset is a temporary dataset not inserted into the
++     database, and needs to be free'd.  */
++  void *dataset_alloc = NULL;
+   time_t timeout = MAX_TIMEOUT_VALUE;
+ 
+   while (!no_more)
+@@ -164,10 +166,12 @@ addhstaiX (struct database_dyn *db, int fd, request_header *req,
+ 	      /* We cannot permanently add the result in the moment.  But
+ 		 we can provide the result as is.  Store the data in some
+ 		 temporary memory.  */
+-	      dataset = (struct dataset *) alloca (total + req->key_len);
++	      dataset = (struct dataset *) malloc (total + req->key_len);
++	      if (dataset == NULL)
++		goto out;
+ 
+ 	      /* We cannot add this record to the permanent database.  */
+-	      alloca_used = true;
++	      dataset_alloc = dataset;
+ 	    }
+ 
+ 	  /* Fill in the address and address families.  */
+@@ -336,10 +340,12 @@ addhstaiX (struct database_dyn *db, int fd, request_header *req,
+ 	      /* We cannot permanently add the result in the moment.  But
+ 		 we can provide the result as is.  Store the data in some
+ 		 temporary memory.  */
+-	      dataset = (struct dataset *) alloca (total + req->key_len);
++	      dataset = (struct dataset *) malloc (total + req->key_len);
++	      if (dataset == NULL)
++		goto out;
+ 
+ 	      /* We cannot add this record to the permanent database.  */
+-	      alloca_used = true;
++	      dataset_alloc = dataset;
+ 	    }
+ 
+ 	  /* Fill in the address and address families.  */
+@@ -391,8 +397,7 @@ addhstaiX (struct database_dyn *db, int fd, request_header *req,
+ 						   resp)) == 0)
+ 	    {
+ 	      /* The data has not changed.  We will just bump the
+-		 timeout value.  Note that the new record has been
+-		 allocated on the stack and need not be freed.  */
++		 timeout value.  */
+ 	      dh->timeout = dataset->head.timeout;
+ 	      dh->ttl = dataset->head.ttl;
+ 	      ++dh->nreloads;
+@@ -410,7 +415,9 @@ addhstaiX (struct database_dyn *db, int fd, request_header *req,
+ 		  key_copy = (char *) newp + (key_copy - (char *) dataset);
+ 
+ 		  dataset = memcpy (newp, dataset, total + req->key_len);
+-		  alloca_used = false;
++
++		  free (dataset_alloc);
++		  dataset_alloc = NULL;
+ 		}
+ 
+ 	      /* Mark the old record as obsolete.  */
+@@ -488,7 +495,7 @@ next_nip:
+  out:
+   __resolv_context_put (ctx);
+ 
+-  if (dataset != NULL && !alloca_used)
++  if (dataset != NULL && dataset_alloc == NULL)
+     {
+       /* If necessary, we also propagate the data to disk.  */
+       if (db->persistent)
+@@ -514,6 +521,8 @@ next_nip:
+   scratch_buffer_free (&tmpbuf4);
+   scratch_buffer_free (&canonbuf);
+ 
++  free (dataset_alloc);
++
+   return timeout;
+ }
+ 
+diff --git a/nscd/hstcache.c b/nscd/hstcache.c
+index 7b3a8ab1ea..11af5cb34a 100644
+--- a/nscd/hstcache.c
++++ b/nscd/hstcache.c
+@@ -15,7 +15,6 @@
+    You should have received a copy of the GNU General Public License
+    along with this program; if not, see <https://www.gnu.org/licenses/>.  */
+ 
+-#include <alloca.h>
+ #include <assert.h>
+ #include <errno.h>
+ #include <error.h>
+@@ -187,7 +186,7 @@ cache_addhst (struct database_dyn *db, int fd, request_header *req,
+       /* Determine the I/O structure.  */
+       size_t h_name_len = strlen (hst->h_name) + 1;
+       size_t h_aliases_cnt;
+-      uint32_t *h_aliases_len;
++      uint32_t *h_aliases_len = NULL;
+       size_t h_addr_list_cnt;
+       char *addresses;
+       char *aliases;
+@@ -201,7 +200,13 @@ cache_addhst (struct database_dyn *db, int fd, request_header *req,
+       for (cnt = 0; hst->h_aliases[cnt] != NULL; ++cnt)
+ 	++h_aliases_cnt;
+       /* Determine the length of all aliases.  */
+-      h_aliases_len = (uint32_t *) alloca (h_aliases_cnt * sizeof (uint32_t));
++      if (h_aliases_cnt > 0)
++	{
++	  h_aliases_len = (uint32_t *) reallocarray (NULL, h_aliases_cnt,
++						     sizeof (uint32_t));
++	  if (h_aliases_len == NULL)
++	    return MAX_TIMEOUT_VALUE;
++	}
+       total = 0;
+       for (cnt = 0; cnt < h_aliases_cnt; ++cnt)
+ 	{
+@@ -215,8 +220,11 @@ cache_addhst (struct database_dyn *db, int fd, request_header *req,
+ 	++h_addr_list_cnt;
+ 
+       if (h_addr_list_cnt == 0)
+-	/* Invalid entry.  */
+-	return MAX_TIMEOUT_VALUE;
++	{
++	  /* Invalid entry.  */
++	  free (h_aliases_len);
++	  return MAX_TIMEOUT_VALUE;
++	}
+ 
+       total += (sizeof (struct dataset)
+ 		+ h_name_len
+@@ -227,8 +235,10 @@ cache_addhst (struct database_dyn *db, int fd, request_header *req,
+ 	 change.  Allocate memory on the cache since it is likely
+ 	 discarded anyway.  If it turns out to be necessary to have a
+ 	 new record we can still allocate real memory.  */
+-      bool alloca_used = false;
+       dataset = NULL;
++      /* If not NULL, dataset is a temporary dataset not inserted into
++	 the database, and needs to be free'd.  */
++      void *dataset_alloc = NULL;
+ 
+       /* If the record contains more than one IP address (used for
+ 	 load balancing etc) don't cache the entry.  This is something
+@@ -244,10 +254,15 @@ cache_addhst (struct database_dyn *db, int fd, request_header *req,
+ 	  /* We cannot permanently add the result in the moment.  But
+ 	     we can provide the result as is.  Store the data in some
+ 	     temporary memory.  */
+-	  dataset = (struct dataset *) alloca (total + req->key_len);
++	  dataset = (struct dataset *) malloc (total + req->key_len);
++	  if (dataset == NULL)
++	    {
++	      free (h_aliases_len);
++	      return MAX_TIMEOUT_VALUE;
++	    }
+ 
+ 	  /* We cannot add this record to the permanent database.  */
+-	  alloca_used = true;
++	  dataset_alloc = dataset;
+ 	}
+ 
+       timeout = datahead_init_pos (&dataset->head, total + req->key_len,
+@@ -270,7 +285,8 @@ cache_addhst (struct database_dyn *db, int fd, request_header *req,
+       cp = dataset->strdata;
+ 
+       cp = mempcpy (cp, hst->h_name, h_name_len);
+-      cp = mempcpy (cp, h_aliases_len, h_aliases_cnt * sizeof (uint32_t));
++      if (h_aliases_cnt > 0)
++	cp = mempcpy (cp, h_aliases_len, h_aliases_cnt * sizeof (uint32_t));
+ 
+       /* The normal addresses first.  */
+       addresses = cp;
+@@ -282,6 +298,8 @@ cache_addhst (struct database_dyn *db, int fd, request_header *req,
+       for (cnt = 0; cnt < h_aliases_cnt; ++cnt)
+ 	cp = mempcpy (cp, hst->h_aliases[cnt], h_aliases_len[cnt]);
+ 
++      free (h_aliases_len);
++
+       assert (cp
+ 	      == dataset->strdata + total - offsetof (struct dataset,
+ 						      strdata));
+@@ -307,8 +325,7 @@ cache_addhst (struct database_dyn *db, int fd, request_header *req,
+ 			 dh->allocsize - offsetof (struct dataset, resp)) == 0)
+ 	    {
+ 	      /* The data has not changed.  We will just bump the
+-		 timeout value.  Note that the new record has been
+-		 allocated on the stack and need not be freed.  */
++		 timeout value.  */
+ 	      assert (h_addr_list_cnt == 1);
+ 	      dh->ttl = dataset->head.ttl;
+ 	      dh->timeout = dataset->head.timeout;
+@@ -334,7 +351,9 @@ cache_addhst (struct database_dyn *db, int fd, request_header *req,
+ 		      key_copy = (char *) newp + (key_copy - (char *) dataset);
+ 
+ 		      dataset = memcpy (newp, dataset, total + req->key_len);
+-		      alloca_used = false;
++
++		      free (dataset_alloc);
++		      dataset_alloc = NULL;
+ 		    }
+ 		}
+ 
+@@ -362,7 +381,7 @@ cache_addhst (struct database_dyn *db, int fd, request_header *req,
+ 	 the current cache handling cannot handle and it is more than
+ 	 questionable whether it is worthwhile complicating the cache
+ 	 handling just for handling such a special case. */
+-      if (! alloca_used)
++      if (dataset_alloc == NULL)
+ 	{
+ 	  /* If necessary, we also propagate the data to disk.  */
+ 	  if (db->persistent)
+@@ -393,6 +412,8 @@ cache_addhst (struct database_dyn *db, int fd, request_header *req,
+ 
+ 	  pthread_rwlock_unlock (&db->lock);
+ 	}
++      free (dataset_alloc);
++      dataset_alloc = NULL;
+     }
+ 
+   if (__builtin_expect (!all_written, 0) && debug_level > 0)
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index d8867bcff9a..66250fbdb2a 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -79,6 +79,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0044-CVE-2026-86805-CVE-2026-95818-02.patch \
            file://0045-CVE-2026-86805-CVE-2026-95818-03.patch \
            file://0046-CVE-2026-86805-CVE-2026-95818-04.patch \
+           file://0047-CVE-2026-89092.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
