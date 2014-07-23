Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6C7BC70818
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 08:04:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6N84lNP023611
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 01:04:47 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 23 Jul 2014 01:04:46 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Jul 2014 04:04:45 -0400
Message-ID: <1406102685-28553-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [PATCH] libxfont: fix for CVE-2014-0209 CVE-2014-0210 CVE-2014-0211
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
X-List-Received-Date: Wed, 23 Jul 2014 08:04:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Zhang Xiao <xiao.zhang@windriver.com>

0001-CVE-2014-0209-integer-overflow-of-realloc-size-in-Fo.patch
CVE-2014-0209:
Multiple integer overflows in the (1) FontFileAddEntry and
(2) lexAlias functions in X.Org libXfont before 1.4.8 and
1.4.9x before 1.4.99.901 might allow local users to gain
privileges by adding a directory with a large fonts.dir or
fonts.alias file to the font path, which triggers a heap-based
buffer overflow, related to metadata.

CVE-2014-0210:
Multiple buffer overflows in X.Org libXfont before 1.4.8 and
1.4.9x before 1.4.99.901 allow remote font servers to execute
arbitrary code via a crafted xfs protocol reply to the
(1) _fs_recv_conn_setup, (2) fs_read_open_font,
(3) fs_read_query_info, (4) fs_read_extent_info,
(5) fs_read_glyphs, (6) fs_read_list, or
(7) fs_read_list_info function.

CVE-2014-0211:
Multiple integer overflows in the (1) fs_get_reply,
(2) fs_alloc_glyphs, and (3) fs_read_extent_info functions
in X.Org libXfont before 1.4.8 and 1.4.9x before 1.4.99.901
allow remote font servers to execute arbitrary code via
a crafted xfs reply, which triggers a buffer overflow.

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...09-integer-overflow-of-realloc-size-in-Fo.patch |  44 ++++++
 ...09-integer-overflow-of-realloc-size-in-le.patch |  50 +++++++
 ...10-unvalidated-length-in-_fs_recv_conn_se.patch |  76 ++++++++++
 ...10-unvalidated-lengths-when-reading-repli.patch | 162 +++++++++++++++++++++
 ...11-Integer-overflow-in-fs_get_reply-_fs_s.patch |  68 +++++++++
 ...10-unvalidated-length-fields-in-fs_read_q.patch | 127 ++++++++++++++++
 ...11-integer-overflow-in-fs_read_extent_inf.patch |  52 +++++++
 ...-0211-integer-overflow-in-fs_alloc_glyphs.patch |  39 +++++
 ...10-unvalidated-length-fields-in-fs_read_e.patch |  42 ++++++
 ...10-unvalidated-length-fields-in-fs_read_g.patch |  79 ++++++++++
 ...10-unvalidated-length-fields-in-fs_read_l.patch |  62 ++++++++
 ...10-unvalidated-length-fields-in-fs_read_l.patch | 111 ++++++++++++++
 meta/recipes-graphics/xorg-lib/libxfont_1.4.7.bb   |  16 ++
 13 files changed, 928 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/0001-CVE-2014-0209-integer-overflow-of-realloc-size-in-Fo.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/0002-CVE-2014-0209-integer-overflow-of-realloc-size-in-le.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/0003-CVE-2014-0210-unvalidated-length-in-_fs_recv_conn_se.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/0004-CVE-2014-0210-unvalidated-lengths-when-reading-repli.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/0005-CVE-2014-0211-Integer-overflow-in-fs_get_reply-_fs_s.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/0006-CVE-2014-0210-unvalidated-length-fields-in-fs_read_q.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/0007-CVE-2014-0211-integer-overflow-in-fs_read_extent_inf.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/0008-CVE-2014-0211-integer-overflow-in-fs_alloc_glyphs.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/0009-CVE-2014-0210-unvalidated-length-fields-in-fs_read_e.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/0010-CVE-2014-0210-unvalidated-length-fields-in-fs_read_g.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/0011-CVE-2014-0210-unvalidated-length-fields-in-fs_read_l.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/0012-CVE-2014-0210-unvalidated-length-fields-in-fs_read_l.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxfont/0001-CVE-2014-0209-integer-overflow-of-realloc-size-in-Fo.patch b/meta/recipes-graphics/xorg-lib/libxfont/0001-CVE-2014-0209-integer-overflow-of-realloc-size-in-Fo.patch
new file mode 100644
index 0000000..eebb5e7
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxfont/0001-CVE-2014-0209-integer-overflow-of-realloc-size-in-Fo.patch
@@ -0,0 +1,44 @@
+CVE-2014-0209: integer overflow of realloc() size in FontFileAddEntry()
+
+Upstream-Status: Backport
+
+Commit 2f5e57317339c526e6eaee1010b0e2ab8089c42e from upstream
+
+FontFileReadDirectory() opens a fonts.dir file, and reads over every
+line in an fscanf loop.  For each successful entry read (font name,
+file name) a call is made to FontFileAddFontFile().
+
+FontFileAddFontFile() will add a font file entry (for the font name
+and file) each time it’s called, by calling FontFileAddEntry().
+FontFileAddEntry() will do the actual adding.  If the table it has
+to add to is full, it will do a realloc, adding 100 more entries
+to the table size without checking to see if that will overflow the
+int used to store the size.
+
+Reported-by: Ilja Van Sprundel <ivansprundel@ioactive.com>
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+Reviewed-by: Adam Jackson <ajax@redhat.com>
+Reviewed-by: Matthieu Herrb <matthieu@herrb.eu>
+---
+ src/fontfile/fontdir.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/fontfile/fontdir.c b/src/fontfile/fontdir.c
+index ef7ffa5..7271603 100644
+--- a/src/fontfile/fontdir.c
++++ b/src/fontfile/fontdir.c
+@@ -177,6 +177,11 @@ FontFileAddEntry(FontTablePtr table, FontEntryPtr prototype)
+     if (table->sorted)
+ 	return (FontEntryPtr) 0;    /* "cannot" happen */
+     if (table->used == table->size) {
++	if (table->size >= ((INT32_MAX / sizeof(FontEntryRec)) - 100))
++	    /* If we've read so many entries we're going to ask for 2gb
++	       or more of memory, something is so wrong with this font
++	       directory that we should just give up before we overflow. */
++	    return NULL;
+ 	newsize = table->size + 100;
+ 	entry = realloc(table->entries, newsize * sizeof(FontEntryRec));
+ 	if (!entry)
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-graphics/xorg-lib/libxfont/0002-CVE-2014-0209-integer-overflow-of-realloc-size-in-le.patch b/meta/recipes-graphics/xorg-lib/libxfont/0002-CVE-2014-0209-integer-overflow-of-realloc-size-in-le.patch
new file mode 100644
index 0000000..ccef393
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxfont/0002-CVE-2014-0209-integer-overflow-of-realloc-size-in-le.patch
@@ -0,0 +1,50 @@
+CVE-2014-0209: integer overflow of realloc() size in lexAlias()
+
+Upstream-Status: Backport
+
+Commit 05c8020a49416dd8b7510cbba45ce4f3fc81a7dc from upstream.
+
+lexAlias() reads from a file in a loop. It does this by starting with a
+64 byte buffer.  If that size limit is hit, it does a realloc of the
+buffer size << 1, basically doubling the needed length every time the
+length limit is hit.
+
+Eventually, this will shift out to 0 (for a length of ~4gig), and that
+length will be passed on to realloc().  A length of 0 (with a valid
+pointer) causes realloc to free the buffer on most POSIX platforms,
+but the caller will still have a pointer to it, leading to use after
+free issues.
+
+Reported-by: Ilja Van Sprundel <ivansprundel@ioactive.com>
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+Reviewed-by: Adam Jackson <ajax@redhat.com>
+Reviewed-by: Matthieu Herrb <matthieu@herrb.eu>
+---
+ src/fontfile/dirfile.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/fontfile/dirfile.c b/src/fontfile/dirfile.c
+index cb28333..38ced75 100644
+--- a/src/fontfile/dirfile.c
++++ b/src/fontfile/dirfile.c
+@@ -42,6 +42,7 @@ in this Software without prior written authorization from The Open Group.
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <errno.h>
++#include <limits.h>
+ 
+ static Bool AddFileNameAliases ( FontDirectoryPtr dir );
+ static int ReadFontAlias ( char *directory, Bool isFile,
+@@ -376,6 +377,9 @@ lexAlias(FILE *file, char **lexToken)
+ 	    int         nsize;
+ 	    char       *nbuf;
+ 
++	    if (tokenSize >= (INT_MAX >> 2))
++		/* Stop before we overflow */
++		return EALLOC;
+ 	    nsize = tokenSize ? (tokenSize << 1) : 64;
+ 	    nbuf = realloc(tokenBuf, nsize);
+ 	    if (!nbuf)
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-graphics/xorg-lib/libxfont/0003-CVE-2014-0210-unvalidated-length-in-_fs_recv_conn_se.patch b/meta/recipes-graphics/xorg-lib/libxfont/0003-CVE-2014-0210-unvalidated-length-in-_fs_recv_conn_se.patch
new file mode 100644
index 0000000..b36b203
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxfont/0003-CVE-2014-0210-unvalidated-length-in-_fs_recv_conn_se.patch
@@ -0,0 +1,76 @@
+CVE-2014-0210: unvalidated length in _fs_recv_conn_setup()
+
+Upstream-Status: Backport
+
+Commit 891e084b26837162b12f841060086a105edde86d from upstream.
+
+The connection setup reply from the font server can include a list
+of alternate servers to contact if this font server stops working.
+
+The reply specifies a total size of all the font server names, and
+then provides a list of names. _fs_recv_conn_setup() allocated the
+specified total size for copying the names to, but didn't check to
+make sure it wasn't copying more data to that buffer than the size
+it had allocated.
+
+Reported-by: Ilja Van Sprundel <ivansprundel@ioactive.com>
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+Reviewed-by: Adam Jackson <ajax@redhat.com>
+Reviewed-by: Matthieu Herrb <matthieu@herrb.eu>
+---
+ src/fc/fserve.c | 20 ++++++++++++++++++--
+ 1 file changed, 18 insertions(+), 2 deletions(-)
+
+diff --git a/src/fc/fserve.c b/src/fc/fserve.c
+index 3585951..aa9acdb 100644
+--- a/src/fc/fserve.c
++++ b/src/fc/fserve.c
+@@ -2784,7 +2784,7 @@ _fs_recv_conn_setup (FSFpePtr conn)
+     int			ret = FSIO_ERROR;
+     fsConnSetup		*setup;
+     FSFpeAltPtr		alts;
+-    int			i, alt_len;
++    unsigned int	i, alt_len;
+     int			setup_len;
+     char		*alt_save, *alt_names;
+ 
+@@ -2811,8 +2811,9 @@ _fs_recv_conn_setup (FSFpePtr conn)
+ 	}
+ 	if (setup->num_alternates)
+ 	{
++	    size_t alt_name_len = setup->alternate_len << 2;
+ 	    alts = malloc (setup->num_alternates * sizeof (FSFpeAltRec) +
+-			   (setup->alternate_len << 2));
++			   alt_name_len);
+ 	    if (alts)
+ 	    {
+ 		alt_names = (char *) (setup + 1);
+@@ -2821,10 +2822,25 @@ _fs_recv_conn_setup (FSFpePtr conn)
+ 		{
+ 		    alts[i].subset = alt_names[0];
+ 		    alt_len = alt_names[1];
++		    if (alt_len >= alt_name_len) {
++			/*
++			 * Length is longer than setup->alternate_len
++			 * told us to allocate room for, assume entire
++			 * alternate list is corrupted.
++			 */
++#ifdef DEBUG
++			fprintf (stderr,
++				 "invalid alt list (length %lx >= %lx)\n",
++				 (long) alt_len, (long) alt_name_len);
++#endif
++			free(alts);
++			return FSIO_ERROR;
++		    }
+ 		    alts[i].name = alt_save;
+ 		    memcpy (alt_save, alt_names + 2, alt_len);
+ 		    alt_save[alt_len] = '\0';
+ 		    alt_save += alt_len + 1;
++		    alt_name_len -= alt_len + 1;
+ 		    alt_names += _fs_pad_length (alt_len + 2);
+ 		}
+ 		conn->numAlts = setup->num_alternates;
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-graphics/xorg-lib/libxfont/0004-CVE-2014-0210-unvalidated-lengths-when-reading-repli.patch b/meta/recipes-graphics/xorg-lib/libxfont/0004-CVE-2014-0210-unvalidated-lengths-when-reading-repli.patch
new file mode 100644
index 0000000..466b561
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxfont/0004-CVE-2014-0210-unvalidated-lengths-when-reading-repli.patch
@@ -0,0 +1,162 @@
+CVE-2014-0210: unvalidated lengths when reading replies from font server
+
+Upstream-Status: Backport
+
+Commit cbb64aef35960b2882be721f4b8fbaa0fb649d12 from upstream.
+
+Functions to handle replies to font server requests were casting replies
+from the generic form to reply specific structs without first checking
+that the reply was at least as long as the struct being cast to.
+
+Reported-by: Ilja Van Sprundel <ivansprundel@ioactive.com>
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+Reviewed-by: Adam Jackson <ajax@redhat.com>
+Reviewed-by: Matthieu Herrb <matthieu@herrb.eu>
+---
+ src/fc/fserve.c | 44 ++++++++++++++++++++++++++++++++++++++------
+ 1 file changed, 38 insertions(+), 6 deletions(-)
+
+diff --git a/src/fc/fserve.c b/src/fc/fserve.c
+index aa9acdb..f08028f 100644
+--- a/src/fc/fserve.c
++++ b/src/fc/fserve.c
+@@ -91,6 +91,12 @@ in this Software without prior written authorization from The Open Group.
+ 			     (pci)->descent || \
+ 			     (pci)->characterWidth)
+ 
++/*
++ * SIZEOF(r) is in bytes, length fields in the protocol are in 32-bit words,
++ * so this converts for doing size comparisons.
++ */
++#define LENGTHOF(r)	(SIZEOF(r) >> 2)
++
+ extern void ErrorF(const char *f, ...);
+ 
+ static int fs_read_glyphs ( FontPathElementPtr fpe, FSBlockDataPtr blockrec );
+@@ -206,9 +212,22 @@ _fs_add_rep_log (FSFpePtr conn, fsGenericReply *rep)
+ 		 rep->sequenceNumber,
+ 		 conn->reqbuffer[i].opcode);
+ }
++
++#define _fs_reply_failed(rep, name, op) do {                            \
++    if (rep) {                                                          \
++        if (rep->type == FS_Error)                                      \
++            fprintf (stderr, "Error: %d Request: %s\n",                 \
++                     ((fsError *)rep)->request, #name);                 \
++        else                                                            \
++            fprintf (stderr, "Bad Length for %s Reply: %d %s %d\n",     \
++                     #name, rep->length, op, LENGTHOF(name));           \
++    }                                                                   \
++} while (0)
++
+ #else
+ #define _fs_add_req_log(conn,op)    ((conn)->current_seq++)
+ #define _fs_add_rep_log(conn,rep)
++#define _fs_reply_failed(rep,name,op)
+ #endif
+ 
+ static Bool
+@@ -682,13 +701,15 @@ fs_read_open_font(FontPathElementPtr fpe, FSBlockDataPtr blockrec)
+     int			    ret;
+ 
+     rep = (fsOpenBitmapFontReply *) fs_get_reply (conn, &ret);
+-    if (!rep || rep->type == FS_Error)
++    if (!rep || rep->type == FS_Error ||
++	(rep->length != LENGTHOF(fsOpenBitmapFontReply)))
+     {
+ 	if (ret == FSIO_BLOCK)
+ 	    return StillWorking;
+ 	if (rep)
+ 	    _fs_done_read (conn, rep->length << 2);
+ 	fs_cleanup_bfont (bfont);
++	_fs_reply_failed (rep, fsOpenBitmapFontReply, "!=");
+ 	return BadFontName;
+     }
+ 
+@@ -824,13 +845,15 @@ fs_read_query_info(FontPathElementPtr fpe, FSBlockDataPtr blockrec)
+     int			ret;
+ 
+     rep = (fsQueryXInfoReply *) fs_get_reply (conn, &ret);
+-    if (!rep || rep->type == FS_Error)
++    if (!rep || rep->type == FS_Error ||
++	(rep->length < LENGTHOF(fsQueryXInfoReply)))
+     {
+ 	if (ret == FSIO_BLOCK)
+ 	    return StillWorking;
+ 	if (rep)
+ 	    _fs_done_read (conn, rep->length << 2);
+ 	fs_cleanup_bfont (bfont);
++	_fs_reply_failed (rep, fsQueryXInfoReply, "<");
+ 	return BadFontName;
+     }
+ 
+@@ -951,13 +974,15 @@ fs_read_extent_info(FontPathElementPtr fpe, FSBlockDataPtr blockrec)
+     FontInfoRec		    *fi = &bfont->pfont->info;
+ 
+     rep = (fsQueryXExtents16Reply *) fs_get_reply (conn, &ret);
+-    if (!rep || rep->type == FS_Error)
++    if (!rep || rep->type == FS_Error ||
++	(rep->length < LENGTHOF(fsQueryXExtents16Reply)))
+     {
+ 	if (ret == FSIO_BLOCK)
+ 	    return StillWorking;
+ 	if (rep)
+ 	    _fs_done_read (conn, rep->length << 2);
+ 	fs_cleanup_bfont (bfont);
++	_fs_reply_failed (rep, fsQueryXExtents16Reply, "<");
+ 	return BadFontName;
+     }
+ 
+@@ -1823,13 +1848,15 @@ fs_read_glyphs(FontPathElementPtr fpe, FSBlockDataPtr blockrec)
+     unsigned long	    minchar, maxchar;
+ 
+     rep = (fsQueryXBitmaps16Reply *) fs_get_reply (conn, &ret);
+-    if (!rep || rep->type == FS_Error)
++    if (!rep || rep->type == FS_Error ||
++	(rep->length < LENGTHOF(fsQueryXBitmaps16Reply)))
+     {
+ 	if (ret == FSIO_BLOCK)
+ 	    return StillWorking;
+ 	if (rep)
+ 	    _fs_done_read (conn, rep->length << 2);
+ 	err = AllocError;
++	_fs_reply_failed (rep, fsQueryXBitmaps16Reply, "<");
+ 	goto bail;
+     }
+ 
+@@ -2232,12 +2259,14 @@ fs_read_list(FontPathElementPtr fpe, FSBlockDataPtr blockrec)
+     int			err;
+ 
+     rep = (fsListFontsReply *) fs_get_reply (conn, &ret);
+-    if (!rep || rep->type == FS_Error)
++    if (!rep || rep->type == FS_Error ||
++	(rep->length < LENGTHOF(fsListFontsReply)))
+     {
+ 	if (ret == FSIO_BLOCK)
+ 	    return StillWorking;
+ 	if (rep)
+ 	    _fs_done_read (conn, rep->length << 2);
++	_fs_reply_failed (rep, fsListFontsReply, "<");
+ 	return AllocError;
+     }
+     data = (char *) rep + SIZEOF (fsListFontsReply);
+@@ -2356,12 +2385,15 @@ fs_read_list_info(FontPathElementPtr fpe, FSBlockDataPtr blockrec)
+     _fs_free_props (&binfo->info);
+ 
+     rep = (fsListFontsWithXInfoReply *) fs_get_reply (conn, &ret);
+-    if (!rep || rep->type == FS_Error)
++    if (!rep || rep->type == FS_Error ||
++	((rep->nameLength != 0) &&
++	 (rep->length < LENGTHOF(fsListFontsWithXInfoReply))))
+     {
+ 	if (ret == FSIO_BLOCK)
+ 	    return StillWorking;
+ 	binfo->status = FS_LFWI_FINISHED;
+ 	err = AllocError;
++	_fs_reply_failed (rep, fsListFontsWithXInfoReply, "<");
+ 	goto done;
+     }
+     /*
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-graphics/xorg-lib/libxfont/0005-CVE-2014-0211-Integer-overflow-in-fs_get_reply-_fs_s.patch b/meta/recipes-graphics/xorg-lib/libxfont/0005-CVE-2014-0211-Integer-overflow-in-fs_get_reply-_fs_s.patch
new file mode 100644
index 0000000..47c4a50
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxfont/0005-CVE-2014-0211-Integer-overflow-in-fs_get_reply-_fs_s.patch
@@ -0,0 +1,68 @@
+CVE-2014-0211: Integer overflow in fs_get_reply/_fs_start_read
+
+Upstream-Status: Backport
+
+Commit 0f1a5d372c143f91a602bdf10c917d7eabaee09b from upstream.
+
+fs_get_reply() would take any reply size, multiply it by 4 and pass to
+_fs_start_read.  If that size was bigger than the current reply buffer
+size, _fs_start_read would add it to the existing buffer size plus the
+buffer size increment constant and realloc the buffer to that result.
+
+This math could overflow, causing the code to allocate a smaller
+buffer than the amount it was about to read into that buffer from
+the network.  It could also succeed, allowing the remote font server
+to cause massive allocations in the X server, possibly using up all
+the address space in a 32-bit X server, allowing the triggering of
+other bugs in code that fails to handle malloc failure properly.
+
+This patch protects against both problems, by disconnecting any
+font server trying to feed us more than (the somewhat arbitrary)
+64 mb in a single reply.
+
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+Reviewed-by: Adam Jackson <ajax@redhat.com>
+Reviewed-by: Matthieu Herrb <matthieu@herrb.eu>
+---
+ src/fc/fserve.c | 18 ++++++++++++++++++
+ 1 file changed, 18 insertions(+)
+
+diff --git a/src/fc/fserve.c b/src/fc/fserve.c
+index f08028f..3abbacf 100644
+--- a/src/fc/fserve.c
++++ b/src/fc/fserve.c
+@@ -97,6 +97,9 @@ in this Software without prior written authorization from The Open Group.
+  */
+ #define LENGTHOF(r)	(SIZEOF(r) >> 2)
+ 
++/* Somewhat arbitrary limit on maximum reply size we'll try to read. */
++#define MAX_REPLY_LENGTH	((64 * 1024 * 1024) >> 2)
++
+ extern void ErrorF(const char *f, ...);
+ 
+ static int fs_read_glyphs ( FontPathElementPtr fpe, FSBlockDataPtr blockrec );
+@@ -619,6 +622,21 @@ fs_get_reply (FSFpePtr conn, int *error)
+ 
+     rep = (fsGenericReply *) buf;
+ 
++    /*
++     * Refuse to accept replies longer than a maximum reasonable length,
++     * before we pass to _fs_start_read, since it will try to resize the
++     * incoming connection buffer to this size.  Also avoids integer overflow
++     * on 32-bit systems.
++     */
++    if (rep->length > MAX_REPLY_LENGTH)
++    {
++	ErrorF("fserve: reply length %d > MAX_REPLY_LENGTH, disconnecting"
++	       " from font server\n", rep->length);
++	_fs_connection_died (conn);
++	*error = FSIO_ERROR;
++	return 0;
++    }
++
+     ret = _fs_start_read (conn, rep->length << 2, &buf);
+     if (ret != FSIO_READY)
+     {
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-graphics/xorg-lib/libxfont/0006-CVE-2014-0210-unvalidated-length-fields-in-fs_read_q.patch b/meta/recipes-graphics/xorg-lib/libxfont/0006-CVE-2014-0210-unvalidated-length-fields-in-fs_read_q.patch
new file mode 100644
index 0000000..c482f47
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxfont/0006-CVE-2014-0210-unvalidated-length-fields-in-fs_read_q.patch
@@ -0,0 +1,127 @@
+CVE-2014-0210: unvalidated length fields in fs_read_query_info()
+
+Upstream-Status: Backport
+
+Commit 491291cabf78efdeec8f18b09e14726a9030cc8f from upstream.
+
+fs_read_query_info() parses a reply from the font server.  The reply
+contains embedded length fields, none of which are validated.  This
+can cause out of bound reads in either fs_read_query_info() or in
+_fs_convert_props() which it calls to parse the fsPropInfo in the reply.
+
+Reported-by: Ilja Van Sprundel <ivansprundel@ioactive.com>
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+Reviewed-by: Adam Jackson <ajax@redhat.com>
+Reviewed-by: Matthieu Herrb <matthieu@herrb.eu>
+---
+ src/fc/fsconvert.c |  9 +++++++++
+ src/fc/fserve.c    | 37 +++++++++++++++++++++++++++++++++++++
+ 2 files changed, 46 insertions(+)
+
+diff --git a/src/fc/fsconvert.c b/src/fc/fsconvert.c
+index 75b5372..dfa1317 100644
+--- a/src/fc/fsconvert.c
++++ b/src/fc/fsconvert.c
+@@ -118,6 +118,10 @@ _fs_convert_props(fsPropInfo *pi, fsPropOffset *po, pointer pd,
+     for (i = 0; i < nprops; i++, dprop++, is_str++)
+     {
+ 	memcpy(&local_off, off_adr, SIZEOF(fsPropOffset));
++	if ((local_off.name.position >= pi->data_len) ||
++		(local_off.name.length >
++		 (pi->data_len - local_off.name.position)))
++	    goto bail;
+ 	dprop->name = MakeAtom(&pdc[local_off.name.position],
+ 			       local_off.name.length, 1);
+ 	if (local_off.type != PropTypeString) {
+@@ -125,10 +129,15 @@ _fs_convert_props(fsPropInfo *pi, fsPropOffset *po, pointer pd,
+ 	    dprop->value = local_off.value.position;
+ 	} else {
+ 	    *is_str = TRUE;
++	    if ((local_off.value.position >= pi->data_len) ||
++		(local_off.value.length >
++		 (pi->data_len - local_off.value.position)))
++		goto bail;
+ 	    dprop->value = (INT32) MakeAtom(&pdc[local_off.value.position],
+ 					    local_off.value.length, 1);
+ 	    if (dprop->value == BAD_RESOURCE)
+ 	    {
++	      bail:
+ 		free (pfi->props);
+ 		pfi->nprops = 0;
+ 		pfi->props = 0;
+diff --git a/src/fc/fserve.c b/src/fc/fserve.c
+index 3abbacf..ec5336e 100644
+--- a/src/fc/fserve.c
++++ b/src/fc/fserve.c
+@@ -854,6 +854,7 @@ fs_read_query_info(FontPathElementPtr fpe, FSBlockDataPtr blockrec)
+     FSFpePtr		conn = (FSFpePtr) fpe->private;
+     fsQueryXInfoReply	*rep;
+     char		*buf;
++    long		bufleft; /* length of reply left to use */
+     fsPropInfo		*pi;
+     fsPropOffset	*po;
+     pointer		pd;
+@@ -885,6 +886,9 @@ fs_read_query_info(FontPathElementPtr fpe, FSBlockDataPtr blockrec)
+     buf = (char *) rep;
+     buf += SIZEOF(fsQueryXInfoReply);
+ 
++    bufleft = rep->length << 2;
++    bufleft -= SIZEOF(fsQueryXInfoReply);
++
+     /* move the data over */
+     fsUnpack_XFontInfoHeader(rep, pInfo);
+ 
+@@ -892,17 +896,50 @@ fs_read_query_info(FontPathElementPtr fpe, FSBlockDataPtr blockrec)
+     _fs_init_fontinfo(conn, pInfo);
+ 
+     /* Compute offsets into the reply */
++    if (bufleft < SIZEOF(fsPropInfo))
++    {
++	ret = -1;
++#ifdef DEBUG
++	fprintf(stderr, "fsQueryXInfo: bufleft (%ld) < SIZEOF(fsPropInfo)\n",
++		bufleft);
++#endif
++	goto bail;
++    }
+     pi = (fsPropInfo *) buf;
+     buf += SIZEOF (fsPropInfo);
++    bufleft -= SIZEOF(fsPropInfo);
+ 
++    if ((bufleft / SIZEOF(fsPropOffset)) < pi->num_offsets)
++    {
++	ret = -1;
++#ifdef DEBUG
++	fprintf(stderr,
++		"fsQueryXInfo: bufleft (%ld) / SIZEOF(fsPropOffset) < %d\n",
++		bufleft, pi->num_offsets);
++#endif
++	goto bail;
++    }
+     po = (fsPropOffset *) buf;
+     buf += pi->num_offsets * SIZEOF(fsPropOffset);
++    bufleft -= pi->num_offsets * SIZEOF(fsPropOffset);
+ 
++    if (bufleft < pi->data_len)
++    {
++	ret = -1;
++#ifdef DEBUG
++	fprintf(stderr,
++		"fsQueryXInfo: bufleft (%ld) < data_len (%d)\n",
++		bufleft, pi->data_len);
++#endif
++	goto bail;
++    }
+     pd = (pointer) buf;
+     buf += pi->data_len;
++    bufleft -= pi->data_len;
+ 
+     /* convert the properties and step over the reply */
+     ret = _fs_convert_props(pi, po, pd, pInfo);
++  bail:
+     _fs_done_read (conn, rep->length << 2);
+ 
+     if (ret == -1)
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-graphics/xorg-lib/libxfont/0007-CVE-2014-0211-integer-overflow-in-fs_read_extent_inf.patch b/meta/recipes-graphics/xorg-lib/libxfont/0007-CVE-2014-0211-integer-overflow-in-fs_read_extent_inf.patch
new file mode 100644
index 0000000..a52e2c1
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxfont/0007-CVE-2014-0211-integer-overflow-in-fs_read_extent_inf.patch
@@ -0,0 +1,52 @@
+CVE-2014-0211: integer overflow in fs_read_extent_info()
+
+Upstream-Status: Backport
+
+Commit c578408c1fd4db09e4e3173f8a9e65c81cc187c1 from upstream.
+
+fs_read_extent_info() parses a reply from the font server.
+The reply contains a 32bit number of elements field which is used
+to calculate a buffer length. There is an integer overflow in this
+calculation which can lead to memory corruption.
+
+Reported-by: Ilja Van Sprundel <ivansprundel@ioactive.com>
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+Reviewed-by: Adam Jackson <ajax@redhat.com>
+Reviewed-by: Matthieu Herrb <matthieu@herrb.eu>
+---
+ src/fc/fserve.c | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/src/fc/fserve.c b/src/fc/fserve.c
+index ec5336e..96abd0e 100644
+--- a/src/fc/fserve.c
++++ b/src/fc/fserve.c
+@@ -70,6 +70,7 @@ in this Software without prior written authorization from The Open Group.
+ #include	"fservestr.h"
+ #include	<X11/fonts/fontutil.h>
+ #include	<errno.h>
++#include	<limits.h>
+ 
+ #include	<time.h>
+ #define Time_t time_t
+@@ -1050,7 +1051,16 @@ fs_read_extent_info(FontPathElementPtr fpe, FSBlockDataPtr blockrec)
+ 	numInfos *= 2;
+ 	haveInk = TRUE;
+     }
+-    ci = pCI = malloc(sizeof(CharInfoRec) * numInfos);
++    if (numInfos >= (INT_MAX / sizeof(CharInfoRec))) {
++#ifdef DEBUG
++	fprintf(stderr,
++		"fsQueryXExtents16: numInfos (%d) >= %ld\n",
++		numInfos, (INT_MAX / sizeof(CharInfoRec)));
++#endif
++	pCI = NULL;
++    }
++    else
++	pCI = malloc(sizeof(CharInfoRec) * numInfos);
+ 
+     if (!pCI)
+     {
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-graphics/xorg-lib/libxfont/0008-CVE-2014-0211-integer-overflow-in-fs_alloc_glyphs.patch b/meta/recipes-graphics/xorg-lib/libxfont/0008-CVE-2014-0211-integer-overflow-in-fs_alloc_glyphs.patch
new file mode 100644
index 0000000..4e5917f
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxfont/0008-CVE-2014-0211-integer-overflow-in-fs_alloc_glyphs.patch
@@ -0,0 +1,39 @@
+CVE-2014-0211: integer overflow in fs_alloc_glyphs()
+
+Upstream-Status: Backport
+
+Commit a42f707f8a62973f5e8bbcd08afb10a79e9cee33 from upstream.
+
+fs_alloc_glyphs() is a malloc wrapper used by the font code.
+It contains a classic integer overflow in the malloc() call,
+which can cause memory corruption.
+
+Reported-by: Ilja Van Sprundel <ivansprundel@ioactive.com>
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+Reviewed-by: Adam Jackson <ajax@redhat.com>
+Reviewed-by: Matthieu Herrb <matthieu@herrb.eu>
+---
+ src/fc/fsconvert.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/fc/fsconvert.c b/src/fc/fsconvert.c
+index dfa1317..18b0c0d 100644
+--- a/src/fc/fsconvert.c
++++ b/src/fc/fsconvert.c
+@@ -721,7 +721,12 @@ fs_alloc_glyphs (FontPtr pFont, int size)
+     FSGlyphPtr	glyphs;
+     FSFontPtr	fsfont = (FSFontPtr) pFont->fontPrivate;
+ 
+-    glyphs = malloc (sizeof (FSGlyphRec) + size);
++    if (size < (INT_MAX - sizeof (FSGlyphRec)))
++	glyphs = malloc (sizeof (FSGlyphRec) + size);
++    else
++	glyphs = NULL;
++    if (glyphs == NULL)
++	return NULL;
+     glyphs->next = fsfont->glyphs;
+     fsfont->glyphs = glyphs;
+     return (pointer) (glyphs + 1);
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-graphics/xorg-lib/libxfont/0009-CVE-2014-0210-unvalidated-length-fields-in-fs_read_e.patch b/meta/recipes-graphics/xorg-lib/libxfont/0009-CVE-2014-0210-unvalidated-length-fields-in-fs_read_e.patch
new file mode 100644
index 0000000..c803e04
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxfont/0009-CVE-2014-0210-unvalidated-length-fields-in-fs_read_e.patch
@@ -0,0 +1,42 @@
+CVE-2014-0210: unvalidated length fields in fs_read_extent_info()
+
+Upstream-Status: Backport
+
+Commit a3f21421537620fc4e1f844a594a4bcd9f7e2bd8 from upstream.
+
+Looping over the extents in the reply could go past the end of the
+reply buffer if the reply indicated more extents than could fit in
+the specified reply length.
+
+Reported-by: Ilja Van Sprundel <ivansprundel@ioactive.com>
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+Reviewed-by: Adam Jackson <ajax@redhat.com>
+Reviewed-by: Matthieu Herrb <matthieu@herrb.eu>
+---
+ src/fc/fserve.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/src/fc/fserve.c b/src/fc/fserve.c
+index 96abd0e..232e969 100644
+--- a/src/fc/fserve.c
++++ b/src/fc/fserve.c
+@@ -1059,6 +1059,16 @@ fs_read_extent_info(FontPathElementPtr fpe, FSBlockDataPtr blockrec)
+ #endif
+ 	pCI = NULL;
+     }
++    else if (numExtents > ((rep->length - LENGTHOF(fsQueryXExtents16Reply))
++			    / LENGTHOF(fsXCharInfo))) {
++#ifdef DEBUG
++	fprintf(stderr,
++		"fsQueryXExtents16: numExtents (%d) > (%d - %d) / %d\n",
++		numExtents, rep->length,
++		LENGTHOF(fsQueryXExtents16Reply), LENGTHOF(fsXCharInfo));
++#endif
++	pCI = NULL;
++    }
+     else
+ 	pCI = malloc(sizeof(CharInfoRec) * numInfos);
+ 
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-graphics/xorg-lib/libxfont/0010-CVE-2014-0210-unvalidated-length-fields-in-fs_read_g.patch b/meta/recipes-graphics/xorg-lib/libxfont/0010-CVE-2014-0210-unvalidated-length-fields-in-fs_read_g.patch
new file mode 100644
index 0000000..fb797fe
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxfont/0010-CVE-2014-0210-unvalidated-length-fields-in-fs_read_g.patch
@@ -0,0 +1,79 @@
+CVE-2014-0210: unvalidated length fields in fs_read_glyphs()
+
+Upstream-Status: Backport
+
+Commit 520683652564c2a4e42328ae23eef9bb63271565 from upstream.
+
+fs_read_glyphs() parses a reply from the font server.  The reply
+contains embedded length fields, none of which are validated.
+This can cause out of bound reads when looping over the glyph
+bitmaps in the reply.
+
+Reported-by: Ilja Van Sprundel <ivansprundel@ioactive.com>
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+Reviewed-by: Adam Jackson <ajax@redhat.com>
+Reviewed-by: Matthieu Herrb <matthieu@herrb.eu>
+---
+ src/fc/fserve.c | 29 ++++++++++++++++++++++++++++-
+ 1 file changed, 28 insertions(+), 1 deletion(-)
+
+diff --git a/src/fc/fserve.c b/src/fc/fserve.c
+index 232e969..581bb1b 100644
+--- a/src/fc/fserve.c
++++ b/src/fc/fserve.c
+@@ -1907,6 +1907,7 @@ fs_read_glyphs(FontPathElementPtr fpe, FSBlockDataPtr blockrec)
+     FontInfoPtr		    pfi = &pfont->info;
+     fsQueryXBitmaps16Reply  *rep;
+     char		    *buf;
++    long		    bufleft; /* length of reply left to use */
+     fsOffset32		    *ppbits;
+     fsOffset32		    local_off;
+     char		    *off_adr;
+@@ -1938,9 +1939,33 @@ fs_read_glyphs(FontPathElementPtr fpe, FSBlockDataPtr blockrec)
+     buf = (char *) rep;
+     buf += SIZEOF (fsQueryXBitmaps16Reply);
+ 
++    bufleft = rep->length << 2;
++    bufleft -= SIZEOF (fsQueryXBitmaps16Reply);
++
++    if ((bufleft / SIZEOF (fsOffset32)) < rep->num_chars)
++    {
++#ifdef DEBUG
++	fprintf(stderr,
++		"fsQueryXBitmaps16: num_chars (%d) > bufleft (%ld) / %d\n",
++		rep->num_chars, bufleft, SIZEOF (fsOffset32));
++#endif
++	err = AllocError;
++	goto bail;
++    }
+     ppbits = (fsOffset32 *) buf;
+     buf += SIZEOF (fsOffset32) * (rep->num_chars);
++    bufleft -= SIZEOF (fsOffset32) * (rep->num_chars);
+ 
++    if (bufleft < rep->nbytes)
++    {
++#ifdef DEBUG
++	fprintf(stderr,
++		"fsQueryXBitmaps16: nbytes (%d) > bufleft (%ld)\n",
++		rep->nbytes, bufleft);
++#endif
++	err = AllocError;
++	goto bail;
++    }
+     pbitmaps = (pointer ) buf;
+ 
+     if (blockrec->type == FS_LOAD_GLYPHS)
+@@ -1998,7 +2023,9 @@ fs_read_glyphs(FontPathElementPtr fpe, FSBlockDataPtr blockrec)
+ 	     */
+ 	    if (NONZEROMETRICS(&fsdata->encoding[minchar].metrics))
+ 	    {
+-		if (local_off.length)
++		if (local_off.length &&
++		    (local_off.position < rep->nbytes) &&
++		    (local_off.length <= (rep->nbytes - local_off.position)))
+ 		{
+ 		    bits = allbits;
+ 		    allbits += local_off.length;
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-graphics/xorg-lib/libxfont/0011-CVE-2014-0210-unvalidated-length-fields-in-fs_read_l.patch b/meta/recipes-graphics/xorg-lib/libxfont/0011-CVE-2014-0210-unvalidated-length-fields-in-fs_read_l.patch
new file mode 100644
index 0000000..a7879f8
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxfont/0011-CVE-2014-0210-unvalidated-length-fields-in-fs_read_l.patch
@@ -0,0 +1,62 @@
+CVE-2014-0210: unvalidated length fields in fs_read_list()
+
+Upstream-Status: Backport
+
+Commit 5fa73ac18474be3032ee7af9c6e29deab163ea39 from upstream.
+
+fs_read_list() parses a reply from the font server.  The reply
+contains a list of strings with embedded length fields, none of
+which are validated. This can cause out of bound reads when looping
+over the strings in the reply.
+
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+---
+ src/fc/fserve.c | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/src/fc/fserve.c b/src/fc/fserve.c
+index 581bb1b..4dcdc04 100644
+--- a/src/fc/fserve.c
++++ b/src/fc/fserve.c
+@@ -2355,6 +2355,7 @@ fs_read_list(FontPathElementPtr fpe, FSBlockDataPtr blockrec)
+     FSBlockedListPtr	blist = (FSBlockedListPtr) blockrec->data;
+     fsListFontsReply	*rep;
+     char		*data;
++    long		dataleft; /* length of reply left to use */
+     int			length,
+ 			i,
+ 			ret;
+@@ -2372,16 +2373,30 @@ fs_read_list(FontPathElementPtr fpe, FSBlockDataPtr blockrec)
+ 	return AllocError;
+     }
+     data = (char *) rep + SIZEOF (fsListFontsReply);
++    dataleft = (rep->length << 2) - SIZEOF (fsListFontsReply);
+ 
+     err = Successful;
+     /* copy data into FontPathRecord */
+     for (i = 0; i < rep->nFonts; i++)
+     {
++	if (dataleft < 1)
++	    break;
+ 	length = *(unsigned char *)data++;
++	dataleft--; /* used length byte */
++	if (length > dataleft) {
++#ifdef DEBUG
++	    fprintf(stderr,
++		    "fsListFonts: name length (%d) > dataleft (%ld)\n",
++		    length, dataleft);
++#endif
++	    err = BadFontName;
++	    break;
++	}
+ 	err = AddFontNamesName(blist->names, data, length);
+ 	if (err != Successful)
+ 	    break;
+ 	data += length;
++	dataleft -= length;
+     }
+     _fs_done_read (conn, rep->length << 2);
+     return err;
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-graphics/xorg-lib/libxfont/0012-CVE-2014-0210-unvalidated-length-fields-in-fs_read_l.patch b/meta/recipes-graphics/xorg-lib/libxfont/0012-CVE-2014-0210-unvalidated-length-fields-in-fs_read_l.patch
new file mode 100644
index 0000000..0d79e15
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxfont/0012-CVE-2014-0210-unvalidated-length-fields-in-fs_read_l.patch
@@ -0,0 +1,111 @@
+CVE-2014-0210: unvalidated length fields in fs_read_list_info()
+
+Upstream-Status: Backport
+
+Commit d338f81df1e188eb16e1d6aeea7f4800f89c1218 from upstream
+
+fs_read_list_info() parses a reply from the font server.  The reply
+contains a number of additional data items with embedded length or
+count fields, none of which are validated. This can cause out of
+bound reads when looping over these items in the reply.
+
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+---
+ src/fc/fserve.c | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 54 insertions(+)
+
+diff --git a/src/fc/fserve.c b/src/fc/fserve.c
+index 4dcdc04..c1cf9d6 100644
+--- a/src/fc/fserve.c
++++ b/src/fc/fserve.c
+@@ -2491,6 +2491,7 @@ fs_read_list_info(FontPathElementPtr fpe, FSBlockDataPtr blockrec)
+     FSBlockedListInfoPtr	binfo = (FSBlockedListInfoPtr) blockrec->data;
+     fsListFontsWithXInfoReply	*rep;
+     char			*buf;
++    long			bufleft;
+     FSFpePtr			conn = (FSFpePtr) fpe->private;
+     fsPropInfo			*pi;
+     fsPropOffset		*po;
+@@ -2527,6 +2528,7 @@ fs_read_list_info(FontPathElementPtr fpe, FSBlockDataPtr blockrec)
+     }
+ 
+     buf = (char *) rep + SIZEOF (fsListFontsWithXInfoReply);
++    bufleft = (rep->length << 2) - SIZEOF (fsListFontsWithXInfoReply);
+ 
+     /*
+      * The original FS implementation didn't match
+@@ -2535,19 +2537,71 @@ fs_read_list_info(FontPathElementPtr fpe, FSBlockDataPtr blockrec)
+      */
+     if (conn->fsMajorVersion <= 1)
+     {
++	if (rep->nameLength > bufleft) {
++#ifdef DEBUG
++	    fprintf(stderr,
++		    "fsListFontsWithXInfo: name length (%d) > bufleft (%ld)\n",
++		    (int) rep->nameLength, bufleft);
++#endif
++	    err = AllocError;
++	    goto done;
++	}
++	/* binfo->name is a 256 char array, rep->nameLength is a CARD8 */
+ 	memcpy (binfo->name, buf, rep->nameLength);
+ 	buf += _fs_pad_length (rep->nameLength);
++	bufleft -= _fs_pad_length (rep->nameLength);
+     }
+     pi = (fsPropInfo *) buf;
++    if (SIZEOF (fsPropInfo) > bufleft) {
++#ifdef DEBUG
++	fprintf(stderr,
++		"fsListFontsWithXInfo: PropInfo length (%d) > bufleft (%ld)\n",
++		(int) SIZEOF (fsPropInfo), bufleft);
++#endif
++	err = AllocError;
++	goto done;
++    }
++    bufleft -= SIZEOF (fsPropInfo);
+     buf += SIZEOF (fsPropInfo);
+     po = (fsPropOffset *) buf;
++    if (pi->num_offsets > (bufleft / SIZEOF (fsPropOffset))) {
++#ifdef DEBUG
++	fprintf(stderr,
++		"fsListFontsWithXInfo: offset length (%d * %d) > bufleft (%ld)\n",
++		pi->num_offsets, (int) SIZEOF (fsPropOffset), bufleft);
++#endif
++	err = AllocError;
++	goto done;
++    }
++    bufleft -= pi->num_offsets * SIZEOF (fsPropOffset);
+     buf += pi->num_offsets * SIZEOF (fsPropOffset);
+     pd = (pointer) buf;
++    if (pi->data_len > bufleft) {
++#ifdef DEBUG
++	fprintf(stderr,
++		"fsListFontsWithXInfo: data length (%d) > bufleft (%ld)\n",
++		pi->data_len, bufleft);
++#endif
++	err = AllocError;
++	goto done;
++    }
++    bufleft -= pi->data_len;
+     buf += pi->data_len;
+     if (conn->fsMajorVersion > 1)
+     {
++	if (rep->nameLength > bufleft) {
++#ifdef DEBUG
++	    fprintf(stderr,
++		    "fsListFontsWithXInfo: name length (%d) > bufleft (%ld)\n",
++		    (int) rep->nameLength, bufleft);
++#endif
++	    err = AllocError;
++	    goto done;
++	}
++	/* binfo->name is a 256 char array, rep->nameLength is a CARD8 */
+ 	memcpy (binfo->name, buf, rep->nameLength);
+ 	buf += _fs_pad_length (rep->nameLength);
++	bufleft -= _fs_pad_length (rep->nameLength);
+     }
+ 
+ #ifdef DEBUG
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-graphics/xorg-lib/libxfont_1.4.7.bb b/meta/recipes-graphics/xorg-lib/libxfont_1.4.7.bb
index d587ba8..35f0539 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont_1.4.7.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont_1.4.7.bb
@@ -18,5 +18,21 @@ XORG_PN = "libXfont"
 
 BBCLASSEXTEND = "native"
 
+SRC_URI += "\
+	     file://0001-CVE-2014-0209-integer-overflow-of-realloc-size-in-Fo.patch \
+	     file://0002-CVE-2014-0209-integer-overflow-of-realloc-size-in-le.patch \
+	     file://0003-CVE-2014-0210-unvalidated-length-in-_fs_recv_conn_se.patch \
+	     file://0004-CVE-2014-0210-unvalidated-lengths-when-reading-repli.patch \
+	     file://0005-CVE-2014-0211-Integer-overflow-in-fs_get_reply-_fs_s.patch \
+	     file://0006-CVE-2014-0210-unvalidated-length-fields-in-fs_read_q.patch \
+	     file://0007-CVE-2014-0211-integer-overflow-in-fs_read_extent_inf.patch \
+	     file://0008-CVE-2014-0211-integer-overflow-in-fs_alloc_glyphs.patch \
+	     file://0009-CVE-2014-0210-unvalidated-length-fields-in-fs_read_e.patch \
+	     file://0010-CVE-2014-0210-unvalidated-length-fields-in-fs_read_g.patch \
+	     file://0011-CVE-2014-0210-unvalidated-length-fields-in-fs_read_l.patch \
+	     file://0012-CVE-2014-0210-unvalidated-length-fields-in-fs_read_l.patch \
+"
+
 SRC_URI[md5sum] = "b21ee5739d5d2e5028b302fbf9fe630b"
 SRC_URI[sha256sum] = "d16ea3541835d296b19cfb05d7e64fc62173d8e7eb93284402ec761b951d1543"
+
-- 
2.0.0


