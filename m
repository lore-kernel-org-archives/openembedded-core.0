Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 86DFB76FE2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:20:00 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id r67so1594004qke.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=OgO1lxRrNc1E3NXYirDactx00qYqFsl2AY2uAE+AedQ=;
	b=k0mHnb9ovBeqP04GptPUhgWINjFO+te3H2mwSJ4ZJ20sHzIKhT8ndvVgZl1r79DU0v
	MGzqpb9ASxEkwkh9RwMiuL4v1eo+Z3h3sM62r6SGMhzvS1GtbGcRYZvIuD6Ao+ibR8jI
	fOjTjz9c0K9heaPKVcS/u3akRLlc9NPz0E3Azd5JDSlIzuhjPF99DjKKm1pQmUY+cP4m
	BzH5WkXi/EW1IIxJJsWUmIIrF6onTbMk2YclRMZ+LCHYLX4aq+HGluEu6BHrbsKB11BX
	s+I5qmdurkxMOhsrri/HK7YEdRmXbhy/rny7Zi9O5wNEZogZLqSoky8CwLpA/0I6ozVn
	dZ/Q==
X-Received: by 10.55.21.14 with SMTP id f14mr139636163qkh.54.1452248401366;
	Fri, 08 Jan 2016 02:20:01 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.20.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:20:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:19:18 +0000
Message-Id: <a0eaf4af451abfb156398a510c28b1fb0eec8c89.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 50/53] bsd-headers, musl: Add recipe for bsd missing features
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
X-List-Received-Date: Fri, 08 Jan 2016 10:20:01 -0000

let musl depend on these headers so they are staged along with libc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/bsd-headers/bsd-headers.bb       |  25 +
 .../bsd-headers/bsd-headers/sys-queue.h            | 846 +++++++++++++++++++++
 .../bsd-headers/bsd-headers/sys-tree.h             | 761 ++++++++++++++++++
 meta/recipes-core/musl/musl_git.bb                 |   1 +
 4 files changed, 1633 insertions(+)
 create mode 100644 meta/recipes-core/bsd-headers/bsd-headers.bb
 create mode 100644 meta/recipes-core/bsd-headers/bsd-headers/sys-queue.h
 create mode 100644 meta/recipes-core/bsd-headers/bsd-headers/sys-tree.h

diff --git a/meta/recipes-core/bsd-headers/bsd-headers.bb b/meta/recipes-core/bsd-headers/bsd-headers.bb
new file mode 100644
index 0000000..ae659ab
--- /dev/null
+++ b/meta/recipes-core/bsd-headers/bsd-headers.bb
@@ -0,0 +1,25 @@
+# Copyright (C) 2016 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "bsd compatible headers"
+LICENSE = "BSD-3-Clause && BSD-2-Clause"
+SECTION = "devel"
+
+SRC_URI = "file://sys-queue.h \
+           file://sys-tree.h \
+          "
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+S = "${WORKDIR}"
+
+do_install() {
+	install -Dm 0644 ${S}/sys-queue.h ${D}${includedir}/sys/queue.h
+	install -Dm 0644 ${S}/sys-tree.h ${D}${includedir}/sys/tree.h
+}
+#
+# We will skip parsing for non-musl systems
+#
+COMPATIBLE_HOST = ".*-musl.*"
diff --git a/meta/recipes-core/bsd-headers/bsd-headers/sys-queue.h b/meta/recipes-core/bsd-headers/bsd-headers/sys-queue.h
new file mode 100644
index 0000000..99d01a5
--- /dev/null
+++ b/meta/recipes-core/bsd-headers/bsd-headers/sys-queue.h
@@ -0,0 +1,846 @@
+/*	$NetBSD: queue.h,v 1.68 2014/11/19 08:10:01 uebayasi Exp $	*/
+
+/*
+ * Copyright (c) 1991, 1993
+ *	The Regents of the University of California.  All rights reserved.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ * 3. Neither the name of the University nor the names of its contributors
+ *    may be used to endorse or promote products derived from this software
+ *    without specific prior written permission.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
+ * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
+ * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
+ * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
+ * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
+ * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
+ * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
+ * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
+ * SUCH DAMAGE.
+ *
+ *	@(#)queue.h	8.5 (Berkeley) 8/20/94
+ */
+
+#ifndef	_SYS_QUEUE_H_
+#define	_SYS_QUEUE_H_
+
+/*
+ * This file defines five types of data structures: singly-linked lists,
+ * lists, simple queues, tail queues, and circular queues.
+ *
+ * A singly-linked list is headed by a single forward pointer. The
+ * elements are singly linked for minimum space and pointer manipulation
+ * overhead at the expense of O(n) removal for arbitrary elements. New
+ * elements can be added to the list after an existing element or at the
+ * head of the list.  Elements being removed from the head of the list
+ * should use the explicit macro for this purpose for optimum
+ * efficiency. A singly-linked list may only be traversed in the forward
+ * direction.  Singly-linked lists are ideal for applications with large
+ * datasets and few or no removals or for implementing a LIFO queue.
+ *
+ * A list is headed by a single forward pointer (or an array of forward
+ * pointers for a hash table header). The elements are doubly linked
+ * so that an arbitrary element can be removed without a need to
+ * traverse the list. New elements can be added to the list before
+ * or after an existing element or at the head of the list. A list
+ * may only be traversed in the forward direction.
+ *
+ * A simple queue is headed by a pair of pointers, one the head of the
+ * list and the other to the tail of the list. The elements are singly
+ * linked to save space, so elements can only be removed from the
+ * head of the list. New elements can be added to the list after
+ * an existing element, at the head of the list, or at the end of the
+ * list. A simple queue may only be traversed in the forward direction.
+ *
+ * A tail queue is headed by a pair of pointers, one to the head of the
+ * list and the other to the tail of the list. The elements are doubly
+ * linked so that an arbitrary element can be removed without a need to
+ * traverse the list. New elements can be added to the list before or
+ * after an existing element, at the head of the list, or at the end of
+ * the list. A tail queue may be traversed in either direction.
+ *
+ * A circle queue is headed by a pair of pointers, one to the head of the
+ * list and the other to the tail of the list. The elements are doubly
+ * linked so that an arbitrary element can be removed without a need to
+ * traverse the list. New elements can be added to the list before or after
+ * an existing element, at the head of the list, or at the end of the list.
+ * A circle queue may be traversed in either direction, but has a more
+ * complex end of list detection.
+ *
+ * For details on the use of these macros, see the queue(3) manual page.
+ */
+
+/*
+ * Include the definition of NULL only on NetBSD because sys/null.h
+ * is not available elsewhere.  This conditional makes the header
+ * portable and it can simply be dropped verbatim into any system.
+ * The caveat is that on other systems some other header
+ * must provide NULL before the macros can be used.
+ */
+#ifdef __NetBSD__
+#include <sys/null.h>
+#endif
+
+#if defined(QUEUEDEBUG)
+# if defined(_KERNEL)
+#  define QUEUEDEBUG_ABORT(...) panic(__VA_ARGS__)
+# else
+#  include <err.h>
+#  define QUEUEDEBUG_ABORT(...) err(1, __VA_ARGS__)
+# endif
+#endif
+
+/*
+ * Singly-linked List definitions.
+ */
+#define	SLIST_HEAD(name, type)						\
+struct name {								\
+	struct type *slh_first;	/* first element */			\
+}
+
+#define	SLIST_HEAD_INITIALIZER(head)					\
+	{ NULL }
+
+#define	SLIST_ENTRY(type)						\
+struct {								\
+	struct type *sle_next;	/* next element */			\
+}
+
+/*
+ * Singly-linked List access methods.
+ */
+#define	SLIST_FIRST(head)	((head)->slh_first)
+#define	SLIST_END(head)		NULL
+#define	SLIST_EMPTY(head)	((head)->slh_first == NULL)
+#define	SLIST_NEXT(elm, field)	((elm)->field.sle_next)
+
+#define	SLIST_FOREACH(var, head, field)					\
+	for((var) = (head)->slh_first;					\
+	    (var) != SLIST_END(head);					\
+	    (var) = (var)->field.sle_next)
+
+#define	SLIST_FOREACH_SAFE(var, head, field, tvar)			\
+	for ((var) = SLIST_FIRST((head));				\
+	    (var) != SLIST_END(head) &&					\
+	    ((tvar) = SLIST_NEXT((var), field), 1);			\
+	    (var) = (tvar))
+
+/*
+ * Singly-linked List functions.
+ */
+#define	SLIST_INIT(head) do {						\
+	(head)->slh_first = SLIST_END(head);				\
+} while (/*CONSTCOND*/0)
+
+#define	SLIST_INSERT_AFTER(slistelm, elm, field) do {			\
+	(elm)->field.sle_next = (slistelm)->field.sle_next;		\
+	(slistelm)->field.sle_next = (elm);				\
+} while (/*CONSTCOND*/0)
+
+#define	SLIST_INSERT_HEAD(head, elm, field) do {			\
+	(elm)->field.sle_next = (head)->slh_first;			\
+	(head)->slh_first = (elm);					\
+} while (/*CONSTCOND*/0)
+
+#define	SLIST_REMOVE_AFTER(slistelm, field) do {			\
+	(slistelm)->field.sle_next =					\
+	    SLIST_NEXT(SLIST_NEXT((slistelm), field), field);		\
+} while (/*CONSTCOND*/0)
+
+#define	SLIST_REMOVE_HEAD(head, field) do {				\
+	(head)->slh_first = (head)->slh_first->field.sle_next;		\
+} while (/*CONSTCOND*/0)
+
+#define	SLIST_REMOVE(head, elm, type, field) do {			\
+	if ((head)->slh_first == (elm)) {				\
+		SLIST_REMOVE_HEAD((head), field);			\
+	}								\
+	else {								\
+		struct type *curelm = (head)->slh_first;		\
+		while(curelm->field.sle_next != (elm))			\
+			curelm = curelm->field.sle_next;		\
+		curelm->field.sle_next =				\
+		    curelm->field.sle_next->field.sle_next;		\
+	}								\
+} while (/*CONSTCOND*/0)
+
+
+/*
+ * List definitions.
+ */
+#define	LIST_HEAD(name, type)						\
+struct name {								\
+	struct type *lh_first;	/* first element */			\
+}
+
+#define	LIST_HEAD_INITIALIZER(head)					\
+	{ NULL }
+
+#define	LIST_ENTRY(type)						\
+struct {								\
+	struct type *le_next;	/* next element */			\
+	struct type **le_prev;	/* address of previous next element */	\
+}
+
+/*
+ * List access methods.
+ */
+#define	LIST_FIRST(head)		((head)->lh_first)
+#define	LIST_END(head)			NULL
+#define	LIST_EMPTY(head)		((head)->lh_first == LIST_END(head))
+#define	LIST_NEXT(elm, field)		((elm)->field.le_next)
+
+#define	LIST_FOREACH(var, head, field)					\
+	for ((var) = ((head)->lh_first);				\
+	    (var) != LIST_END(head);					\
+	    (var) = ((var)->field.le_next))
+
+#define	LIST_FOREACH_SAFE(var, head, field, tvar)			\
+	for ((var) = LIST_FIRST((head));				\
+	    (var) != LIST_END(head) &&					\
+	    ((tvar) = LIST_NEXT((var), field), 1);			\
+	    (var) = (tvar))
+
+#define	LIST_MOVE(head1, head2) do {					\
+	LIST_INIT((head2));						\
+	if (!LIST_EMPTY((head1))) {					\
+		(head2)->lh_first = (head1)->lh_first;			\
+		LIST_INIT((head1));					\
+	}								\
+} while (/*CONSTCOND*/0)
+
+/*
+ * List functions.
+ */
+#if defined(QUEUEDEBUG)
+#define	QUEUEDEBUG_LIST_INSERT_HEAD(head, elm, field)			\
+	if ((head)->lh_first &&						\
+	    (head)->lh_first->field.le_prev != &(head)->lh_first)	\
+		QUEUEDEBUG_ABORT("LIST_INSERT_HEAD %p %s:%d", (head),	\
+		    __FILE__, __LINE__);
+#define	QUEUEDEBUG_LIST_OP(elm, field)					\
+	if ((elm)->field.le_next &&					\
+	    (elm)->field.le_next->field.le_prev !=			\
+	    &(elm)->field.le_next)					\
+		QUEUEDEBUG_ABORT("LIST_* forw %p %s:%d", (elm),		\
+		    __FILE__, __LINE__);				\
+	if (*(elm)->field.le_prev != (elm))				\
+		QUEUEDEBUG_ABORT("LIST_* back %p %s:%d", (elm),		\
+		    __FILE__, __LINE__);
+#define	QUEUEDEBUG_LIST_POSTREMOVE(elm, field)				\
+	(elm)->field.le_next = (void *)1L;				\
+	(elm)->field.le_prev = (void *)1L;
+#else
+#define	QUEUEDEBUG_LIST_INSERT_HEAD(head, elm, field)
+#define	QUEUEDEBUG_LIST_OP(elm, field)
+#define	QUEUEDEBUG_LIST_POSTREMOVE(elm, field)
+#endif
+
+#define	LIST_INIT(head) do {						\
+	(head)->lh_first = LIST_END(head);				\
+} while (/*CONSTCOND*/0)
+
+#define	LIST_INSERT_AFTER(listelm, elm, field) do {			\
+	QUEUEDEBUG_LIST_OP((listelm), field)				\
+	if (((elm)->field.le_next = (listelm)->field.le_next) != 	\
+	    LIST_END(head))						\
+		(listelm)->field.le_next->field.le_prev =		\
+		    &(elm)->field.le_next;				\
+	(listelm)->field.le_next = (elm);				\
+	(elm)->field.le_prev = &(listelm)->field.le_next;		\
+} while (/*CONSTCOND*/0)
+
+#define	LIST_INSERT_BEFORE(listelm, elm, field) do {			\
+	QUEUEDEBUG_LIST_OP((listelm), field)				\
+	(elm)->field.le_prev = (listelm)->field.le_prev;		\
+	(elm)->field.le_next = (listelm);				\
+	*(listelm)->field.le_prev = (elm);				\
+	(listelm)->field.le_prev = &(elm)->field.le_next;		\
+} while (/*CONSTCOND*/0)
+
+#define	LIST_INSERT_HEAD(head, elm, field) do {				\
+	QUEUEDEBUG_LIST_INSERT_HEAD((head), (elm), field)		\
+	if (((elm)->field.le_next = (head)->lh_first) != LIST_END(head))\
+		(head)->lh_first->field.le_prev = &(elm)->field.le_next;\
+	(head)->lh_first = (elm);					\
+	(elm)->field.le_prev = &(head)->lh_first;			\
+} while (/*CONSTCOND*/0)
+
+#define	LIST_REMOVE(elm, field) do {					\
+	QUEUEDEBUG_LIST_OP((elm), field)				\
+	if ((elm)->field.le_next != NULL)				\
+		(elm)->field.le_next->field.le_prev = 			\
+		    (elm)->field.le_prev;				\
+	*(elm)->field.le_prev = (elm)->field.le_next;			\
+	QUEUEDEBUG_LIST_POSTREMOVE((elm), field)			\
+} while (/*CONSTCOND*/0)
+
+#define LIST_REPLACE(elm, elm2, field) do {				\
+	if (((elm2)->field.le_next = (elm)->field.le_next) != NULL)	\
+		(elm2)->field.le_next->field.le_prev =			\
+		    &(elm2)->field.le_next;				\
+	(elm2)->field.le_prev = (elm)->field.le_prev;			\
+	*(elm2)->field.le_prev = (elm2);				\
+	QUEUEDEBUG_LIST_POSTREMOVE((elm), field)			\
+} while (/*CONSTCOND*/0)
+
+/*
+ * Simple queue definitions.
+ */
+#define	SIMPLEQ_HEAD(name, type)					\
+struct name {								\
+	struct type *sqh_first;	/* first element */			\
+	struct type **sqh_last;	/* addr of last next element */		\
+}
+
+#define	SIMPLEQ_HEAD_INITIALIZER(head)					\
+	{ NULL, &(head).sqh_first }
+
+#define	SIMPLEQ_ENTRY(type)						\
+struct {								\
+	struct type *sqe_next;	/* next element */			\
+}
+
+/*
+ * Simple queue access methods.
+ */
+#define	SIMPLEQ_FIRST(head)		((head)->sqh_first)
+#define	SIMPLEQ_END(head)		NULL
+#define	SIMPLEQ_EMPTY(head)		((head)->sqh_first == SIMPLEQ_END(head))
+#define	SIMPLEQ_NEXT(elm, field)	((elm)->field.sqe_next)
+
+#define	SIMPLEQ_FOREACH(var, head, field)				\
+	for ((var) = ((head)->sqh_first);				\
+	    (var) != SIMPLEQ_END(head);					\
+	    (var) = ((var)->field.sqe_next))
+
+#define	SIMPLEQ_FOREACH_SAFE(var, head, field, next)			\
+	for ((var) = ((head)->sqh_first);				\
+	    (var) != SIMPLEQ_END(head) &&				\
+	    ((next = ((var)->field.sqe_next)), 1);			\
+	    (var) = (next))
+
+/*
+ * Simple queue functions.
+ */
+#define	SIMPLEQ_INIT(head) do {						\
+	(head)->sqh_first = NULL;					\
+	(head)->sqh_last = &(head)->sqh_first;				\
+} while (/*CONSTCOND*/0)
+
+#define	SIMPLEQ_INSERT_HEAD(head, elm, field) do {			\
+	if (((elm)->field.sqe_next = (head)->sqh_first) == NULL)	\
+		(head)->sqh_last = &(elm)->field.sqe_next;		\
+	(head)->sqh_first = (elm);					\
+} while (/*CONSTCOND*/0)
+
+#define	SIMPLEQ_INSERT_TAIL(head, elm, field) do {			\
+	(elm)->field.sqe_next = NULL;					\
+	*(head)->sqh_last = (elm);					\
+	(head)->sqh_last = &(elm)->field.sqe_next;			\
+} while (/*CONSTCOND*/0)
+
+#define	SIMPLEQ_INSERT_AFTER(head, listelm, elm, field) do {		\
+	if (((elm)->field.sqe_next = (listelm)->field.sqe_next) == NULL)\
+		(head)->sqh_last = &(elm)->field.sqe_next;		\
+	(listelm)->field.sqe_next = (elm);				\
+} while (/*CONSTCOND*/0)
+
+#define	SIMPLEQ_REMOVE_HEAD(head, field) do {				\
+	if (((head)->sqh_first = (head)->sqh_first->field.sqe_next) == NULL) \
+		(head)->sqh_last = &(head)->sqh_first;			\
+} while (/*CONSTCOND*/0)
+
+#define SIMPLEQ_REMOVE_AFTER(head, elm, field) do {			\
+	if (((elm)->field.sqe_next = (elm)->field.sqe_next->field.sqe_next) \
+	    == NULL)							\
+		(head)->sqh_last = &(elm)->field.sqe_next;		\
+} while (/*CONSTCOND*/0)
+
+#define	SIMPLEQ_REMOVE(head, elm, type, field) do {			\
+	if ((head)->sqh_first == (elm)) {				\
+		SIMPLEQ_REMOVE_HEAD((head), field);			\
+	} else {							\
+		struct type *curelm = (head)->sqh_first;		\
+		while (curelm->field.sqe_next != (elm))			\
+			curelm = curelm->field.sqe_next;		\
+		if ((curelm->field.sqe_next =				\
+			curelm->field.sqe_next->field.sqe_next) == NULL) \
+			    (head)->sqh_last = &(curelm)->field.sqe_next; \
+	}								\
+} while (/*CONSTCOND*/0)
+
+#define	SIMPLEQ_CONCAT(head1, head2) do {				\
+	if (!SIMPLEQ_EMPTY((head2))) {					\
+		*(head1)->sqh_last = (head2)->sqh_first;		\
+		(head1)->sqh_last = (head2)->sqh_last;		\
+		SIMPLEQ_INIT((head2));					\
+	}								\
+} while (/*CONSTCOND*/0)
+
+#define	SIMPLEQ_LAST(head, type, field)					\
+	(SIMPLEQ_EMPTY((head)) ?						\
+		NULL :							\
+	        ((struct type *)(void *)				\
+		((char *)((head)->sqh_last) - offsetof(struct type, field))))
+
+/*
+ * Tail queue definitions.
+ */
+#define	_TAILQ_HEAD(name, type, qual)					\
+struct name {								\
+	qual type *tqh_first;		/* first element */		\
+	qual type *qual *tqh_last;	/* addr of last next element */	\
+}
+#define TAILQ_HEAD(name, type)	_TAILQ_HEAD(name, struct type,)
+
+#define	TAILQ_HEAD_INITIALIZER(head)					\
+	{ TAILQ_END(head), &(head).tqh_first }
+
+#define	_TAILQ_ENTRY(type, qual)					\
+struct {								\
+	qual type *tqe_next;		/* next element */		\
+	qual type *qual *tqe_prev;	/* address of previous next element */\
+}
+#define TAILQ_ENTRY(type)	_TAILQ_ENTRY(struct type,)
+
+/*
+ * Tail queue access methods.
+ */
+#define	TAILQ_FIRST(head)		((head)->tqh_first)
+#define	TAILQ_END(head)			(NULL)
+#define	TAILQ_NEXT(elm, field)		((elm)->field.tqe_next)
+#define	TAILQ_LAST(head, headname) \
+	(*(((struct headname *)((head)->tqh_last))->tqh_last))
+#define	TAILQ_PREV(elm, headname, field) \
+	(*(((struct headname *)((elm)->field.tqe_prev))->tqh_last))
+#define	TAILQ_EMPTY(head)		(TAILQ_FIRST(head) == TAILQ_END(head))
+
+
+#define	TAILQ_FOREACH(var, head, field)					\
+	for ((var) = ((head)->tqh_first);				\
+	    (var) != TAILQ_END(head);					\
+	    (var) = ((var)->field.tqe_next))
+
+#define	TAILQ_FOREACH_SAFE(var, head, field, next)			\
+	for ((var) = ((head)->tqh_first);				\
+	    (var) != TAILQ_END(head) &&					\
+	    ((next) = TAILQ_NEXT(var, field), 1); (var) = (next))
+
+#define	TAILQ_FOREACH_REVERSE(var, head, headname, field)		\
+	for ((var) = (*(((struct headname *)((head)->tqh_last))->tqh_last));\
+	    (var) != TAILQ_END(head);					\
+	    (var) = (*(((struct headname *)((var)->field.tqe_prev))->tqh_last)))
+
+#define	TAILQ_FOREACH_REVERSE_SAFE(var, head, headname, field, prev)	\
+	for ((var) = TAILQ_LAST((head), headname);			\
+	    (var) != TAILQ_END(head) && 				\
+	    ((prev) = TAILQ_PREV((var), headname, field), 1); (var) = (prev))
+
+/*
+ * Tail queue functions.
+ */
+#if defined(QUEUEDEBUG)
+#define	QUEUEDEBUG_TAILQ_INSERT_HEAD(head, elm, field)			\
+	if ((head)->tqh_first &&					\
+	    (head)->tqh_first->field.tqe_prev != &(head)->tqh_first)	\
+		QUEUEDEBUG_ABORT("TAILQ_INSERT_HEAD %p %s:%d", (head),	\
+		    __FILE__, __LINE__);
+#define	QUEUEDEBUG_TAILQ_INSERT_TAIL(head, elm, field)			\
+	if (*(head)->tqh_last != NULL)					\
+		QUEUEDEBUG_ABORT("TAILQ_INSERT_TAIL %p %s:%d", (head),	\
+		    __FILE__, __LINE__);
+#define	QUEUEDEBUG_TAILQ_OP(elm, field)					\
+	if ((elm)->field.tqe_next &&					\
+	    (elm)->field.tqe_next->field.tqe_prev !=			\
+	    &(elm)->field.tqe_next)					\
+		QUEUEDEBUG_ABORT("TAILQ_* forw %p %s:%d", (elm),	\
+		    __FILE__, __LINE__);				\
+	if (*(elm)->field.tqe_prev != (elm))				\
+		QUEUEDEBUG_ABORT("TAILQ_* back %p %s:%d", (elm),	\
+		    __FILE__, __LINE__);
+#define	QUEUEDEBUG_TAILQ_PREREMOVE(head, elm, field)			\
+	if ((elm)->field.tqe_next == NULL &&				\
+	    (head)->tqh_last != &(elm)->field.tqe_next)			\
+		QUEUEDEBUG_ABORT("TAILQ_PREREMOVE head %p elm %p %s:%d",\
+		    (head), (elm), __FILE__, __LINE__);
+#define	QUEUEDEBUG_TAILQ_POSTREMOVE(elm, field)				\
+	(elm)->field.tqe_next = (void *)1L;				\
+	(elm)->field.tqe_prev = (void *)1L;
+#else
+#define	QUEUEDEBUG_TAILQ_INSERT_HEAD(head, elm, field)
+#define	QUEUEDEBUG_TAILQ_INSERT_TAIL(head, elm, field)
+#define	QUEUEDEBUG_TAILQ_OP(elm, field)
+#define	QUEUEDEBUG_TAILQ_PREREMOVE(head, elm, field)
+#define	QUEUEDEBUG_TAILQ_POSTREMOVE(elm, field)
+#endif
+
+#define	TAILQ_INIT(head) do {						\
+	(head)->tqh_first = TAILQ_END(head);				\
+	(head)->tqh_last = &(head)->tqh_first;				\
+} while (/*CONSTCOND*/0)
+
+#define	TAILQ_INSERT_HEAD(head, elm, field) do {			\
+	QUEUEDEBUG_TAILQ_INSERT_HEAD((head), (elm), field)		\
+	if (((elm)->field.tqe_next = (head)->tqh_first) != TAILQ_END(head))\
+		(head)->tqh_first->field.tqe_prev =			\
+		    &(elm)->field.tqe_next;				\
+	else								\
+		(head)->tqh_last = &(elm)->field.tqe_next;		\
+	(head)->tqh_first = (elm);					\
+	(elm)->field.tqe_prev = &(head)->tqh_first;			\
+} while (/*CONSTCOND*/0)
+
+#define	TAILQ_INSERT_TAIL(head, elm, field) do {			\
+	QUEUEDEBUG_TAILQ_INSERT_TAIL((head), (elm), field)		\
+	(elm)->field.tqe_next = TAILQ_END(head);			\
+	(elm)->field.tqe_prev = (head)->tqh_last;			\
+	*(head)->tqh_last = (elm);					\
+	(head)->tqh_last = &(elm)->field.tqe_next;			\
+} while (/*CONSTCOND*/0)
+
+#define	TAILQ_INSERT_AFTER(head, listelm, elm, field) do {		\
+	QUEUEDEBUG_TAILQ_OP((listelm), field)				\
+	if (((elm)->field.tqe_next = (listelm)->field.tqe_next) != 	\
+	    TAILQ_END(head))						\
+		(elm)->field.tqe_next->field.tqe_prev = 		\
+		    &(elm)->field.tqe_next;				\
+	else								\
+		(head)->tqh_last = &(elm)->field.tqe_next;		\
+	(listelm)->field.tqe_next = (elm);				\
+	(elm)->field.tqe_prev = &(listelm)->field.tqe_next;		\
+} while (/*CONSTCOND*/0)
+
+#define	TAILQ_INSERT_BEFORE(listelm, elm, field) do {			\
+	QUEUEDEBUG_TAILQ_OP((listelm), field)				\
+	(elm)->field.tqe_prev = (listelm)->field.tqe_prev;		\
+	(elm)->field.tqe_next = (listelm);				\
+	*(listelm)->field.tqe_prev = (elm);				\
+	(listelm)->field.tqe_prev = &(elm)->field.tqe_next;		\
+} while (/*CONSTCOND*/0)
+
+#define	TAILQ_REMOVE(head, elm, field) do {				\
+	QUEUEDEBUG_TAILQ_PREREMOVE((head), (elm), field)		\
+	QUEUEDEBUG_TAILQ_OP((elm), field)				\
+	if (((elm)->field.tqe_next) != TAILQ_END(head))			\
+		(elm)->field.tqe_next->field.tqe_prev = 		\
+		    (elm)->field.tqe_prev;				\
+	else								\
+		(head)->tqh_last = (elm)->field.tqe_prev;		\
+	*(elm)->field.tqe_prev = (elm)->field.tqe_next;			\
+	QUEUEDEBUG_TAILQ_POSTREMOVE((elm), field);			\
+} while (/*CONSTCOND*/0)
+
+#define TAILQ_REPLACE(head, elm, elm2, field) do {			\
+        if (((elm2)->field.tqe_next = (elm)->field.tqe_next) != 	\
+	    TAILQ_END(head))   						\
+                (elm2)->field.tqe_next->field.tqe_prev =		\
+                    &(elm2)->field.tqe_next;				\
+        else								\
+                (head)->tqh_last = &(elm2)->field.tqe_next;		\
+        (elm2)->field.tqe_prev = (elm)->field.tqe_prev;			\
+        *(elm2)->field.tqe_prev = (elm2);				\
+	QUEUEDEBUG_TAILQ_POSTREMOVE((elm), field);			\
+} while (/*CONSTCOND*/0)
+
+#define	TAILQ_CONCAT(head1, head2, field) do {				\
+	if (!TAILQ_EMPTY(head2)) {					\
+		*(head1)->tqh_last = (head2)->tqh_first;		\
+		(head2)->tqh_first->field.tqe_prev = (head1)->tqh_last;	\
+		(head1)->tqh_last = (head2)->tqh_last;			\
+		TAILQ_INIT((head2));					\
+	}								\
+} while (/*CONSTCOND*/0)
+
+/*
+ * Singly-linked Tail queue declarations.
+ */
+#define	STAILQ_HEAD(name, type)						\
+struct name {								\
+	struct type *stqh_first;	/* first element */		\
+	struct type **stqh_last;	/* addr of last next element */	\
+}
+
+#define	STAILQ_HEAD_INITIALIZER(head)					\
+	{ NULL, &(head).stqh_first }
+
+#define	STAILQ_ENTRY(type)						\
+struct {								\
+	struct type *stqe_next;	/* next element */			\
+}
+
+/*
+ * Singly-linked Tail queue access methods.
+ */
+#define	STAILQ_FIRST(head)	((head)->stqh_first)
+#define	STAILQ_END(head)	NULL
+#define	STAILQ_NEXT(elm, field)	((elm)->field.stqe_next)
+#define	STAILQ_EMPTY(head)	(STAILQ_FIRST(head) == STAILQ_END(head))
+
+/*
+ * Singly-linked Tail queue functions.
+ */
+#define	STAILQ_INIT(head) do {						\
+	(head)->stqh_first = NULL;					\
+	(head)->stqh_last = &(head)->stqh_first;				\
+} while (/*CONSTCOND*/0)
+
+#define	STAILQ_INSERT_HEAD(head, elm, field) do {			\
+	if (((elm)->field.stqe_next = (head)->stqh_first) == NULL)	\
+		(head)->stqh_last = &(elm)->field.stqe_next;		\
+	(head)->stqh_first = (elm);					\
+} while (/*CONSTCOND*/0)
+
+#define	STAILQ_INSERT_TAIL(head, elm, field) do {			\
+	(elm)->field.stqe_next = NULL;					\
+	*(head)->stqh_last = (elm);					\
+	(head)->stqh_last = &(elm)->field.stqe_next;			\
+} while (/*CONSTCOND*/0)
+
+#define	STAILQ_INSERT_AFTER(head, listelm, elm, field) do {		\
+	if (((elm)->field.stqe_next = (listelm)->field.stqe_next) == NULL)\
+		(head)->stqh_last = &(elm)->field.stqe_next;		\
+	(listelm)->field.stqe_next = (elm);				\
+} while (/*CONSTCOND*/0)
+
+#define	STAILQ_REMOVE_HEAD(head, field) do {				\
+	if (((head)->stqh_first = (head)->stqh_first->field.stqe_next) == NULL) \
+		(head)->stqh_last = &(head)->stqh_first;			\
+} while (/*CONSTCOND*/0)
+
+#define	STAILQ_REMOVE(head, elm, type, field) do {			\
+	if ((head)->stqh_first == (elm)) {				\
+		STAILQ_REMOVE_HEAD((head), field);			\
+	} else {							\
+		struct type *curelm = (head)->stqh_first;		\
+		while (curelm->field.stqe_next != (elm))			\
+			curelm = curelm->field.stqe_next;		\
+		if ((curelm->field.stqe_next =				\
+			curelm->field.stqe_next->field.stqe_next) == NULL) \
+			    (head)->stqh_last = &(curelm)->field.stqe_next; \
+	}								\
+} while (/*CONSTCOND*/0)
+
+#define	STAILQ_FOREACH(var, head, field)				\
+	for ((var) = ((head)->stqh_first);				\
+		(var);							\
+		(var) = ((var)->field.stqe_next))
+
+#define	STAILQ_FOREACH_SAFE(var, head, field, tvar)			\
+	for ((var) = STAILQ_FIRST((head));				\
+	    (var) && ((tvar) = STAILQ_NEXT((var), field), 1);		\
+	    (var) = (tvar))
+
+#define	STAILQ_CONCAT(head1, head2) do {				\
+	if (!STAILQ_EMPTY((head2))) {					\
+		*(head1)->stqh_last = (head2)->stqh_first;		\
+		(head1)->stqh_last = (head2)->stqh_last;		\
+		STAILQ_INIT((head2));					\
+	}								\
+} while (/*CONSTCOND*/0)
+
+#define	STAILQ_LAST(head, type, field)					\
+	(STAILQ_EMPTY((head)) ?						\
+		NULL :							\
+	        ((struct type *)(void *)				\
+		((char *)((head)->stqh_last) - offsetof(struct type, field))))
+
+
+#ifndef _KERNEL
+/*
+ * Circular queue definitions. Do not use. We still keep the macros
+ * for compatibility but because of pointer aliasing issues their use
+ * is discouraged!
+ */
+
+/*
+ * __launder_type():  We use this ugly hack to work around the the compiler
+ * noticing that two types may not alias each other and elide tests in code.
+ * We hit this in the CIRCLEQ macros when comparing 'struct name *' and
+ * 'struct type *' (see CIRCLEQ_HEAD()).  Modern compilers (such as GCC
+ * 4.8) declare these comparisons as always false, causing the code to
+ * not run as designed.
+ *
+ * This hack is only to be used for comparisons and thus can be fully const.
+ * Do not use for assignment.
+ *
+ * If we ever choose to change the ABI of the CIRCLEQ macros, we could fix
+ * this by changing the head/tail sentinal values, but see the note above
+ * this one.
+ */
+static __inline const void * __launder_type(const void *);
+static __inline const void *
+__launder_type(const void *__x)
+{
+	__asm __volatile("" : "+r" (__x));
+	return __x;
+}
+
+#if defined(QUEUEDEBUG)
+#define QUEUEDEBUG_CIRCLEQ_HEAD(head, field)				\
+	if ((head)->cqh_first != CIRCLEQ_ENDC(head) &&			\
+	    (head)->cqh_first->field.cqe_prev != CIRCLEQ_ENDC(head))	\
+		QUEUEDEBUG_ABORT("CIRCLEQ head forw %p %s:%d", (head),	\
+		      __FILE__, __LINE__);				\
+	if ((head)->cqh_last != CIRCLEQ_ENDC(head) &&			\
+	    (head)->cqh_last->field.cqe_next != CIRCLEQ_ENDC(head))	\
+		QUEUEDEBUG_ABORT("CIRCLEQ head back %p %s:%d", (head),	\
+		      __FILE__, __LINE__);
+#define QUEUEDEBUG_CIRCLEQ_ELM(head, elm, field)			\
+	if ((elm)->field.cqe_next == CIRCLEQ_ENDC(head)) {		\
+		if ((head)->cqh_last != (elm))				\
+			QUEUEDEBUG_ABORT("CIRCLEQ elm last %p %s:%d",	\
+			    (elm), __FILE__, __LINE__);			\
+	} else {							\
+		if ((elm)->field.cqe_next->field.cqe_prev != (elm))	\
+			QUEUEDEBUG_ABORT("CIRCLEQ elm forw %p %s:%d",	\
+			    (elm), __FILE__, __LINE__);			\
+	}								\
+	if ((elm)->field.cqe_prev == CIRCLEQ_ENDC(head)) {		\
+		if ((head)->cqh_first != (elm))				\
+			QUEUEDEBUG_ABORT("CIRCLEQ elm first %p %s:%d",	\
+			    (elm), __FILE__, __LINE__);			\
+	} else {							\
+		if ((elm)->field.cqe_prev->field.cqe_next != (elm))	\
+			QUEUEDEBUG_ABORT("CIRCLEQ elm prev %p %s:%d",	\
+			    (elm), __FILE__, __LINE__);			\
+	}
+#define QUEUEDEBUG_CIRCLEQ_POSTREMOVE(elm, field)			\
+	(elm)->field.cqe_next = (void *)1L;				\
+	(elm)->field.cqe_prev = (void *)1L;
+#else
+#define QUEUEDEBUG_CIRCLEQ_HEAD(head, field)
+#define QUEUEDEBUG_CIRCLEQ_ELM(head, elm, field)
+#define QUEUEDEBUG_CIRCLEQ_POSTREMOVE(elm, field)
+#endif
+
+#define	CIRCLEQ_HEAD(name, type)					\
+struct name {								\
+	struct type *cqh_first;		/* first element */		\
+	struct type *cqh_last;		/* last element */		\
+}
+
+#define	CIRCLEQ_HEAD_INITIALIZER(head)					\
+	{ CIRCLEQ_END(&head), CIRCLEQ_END(&head) }
+
+#define	CIRCLEQ_ENTRY(type)						\
+struct {								\
+	struct type *cqe_next;		/* next element */		\
+	struct type *cqe_prev;		/* previous element */		\
+}
+
+/*
+ * Circular queue functions.
+ */
+#define	CIRCLEQ_INIT(head) do {						\
+	(head)->cqh_first = CIRCLEQ_END(head);				\
+	(head)->cqh_last = CIRCLEQ_END(head);				\
+} while (/*CONSTCOND*/0)
+
+#define	CIRCLEQ_INSERT_AFTER(head, listelm, elm, field) do {		\
+	QUEUEDEBUG_CIRCLEQ_HEAD((head), field)				\
+	QUEUEDEBUG_CIRCLEQ_ELM((head), (listelm), field)		\
+	(elm)->field.cqe_next = (listelm)->field.cqe_next;		\
+	(elm)->field.cqe_prev = (listelm);				\
+	if ((listelm)->field.cqe_next == CIRCLEQ_ENDC(head))		\
+		(head)->cqh_last = (elm);				\
+	else								\
+		(listelm)->field.cqe_next->field.cqe_prev = (elm);	\
+	(listelm)->field.cqe_next = (elm);				\
+} while (/*CONSTCOND*/0)
+
+#define	CIRCLEQ_INSERT_BEFORE(head, listelm, elm, field) do {		\
+	QUEUEDEBUG_CIRCLEQ_HEAD((head), field)				\
+	QUEUEDEBUG_CIRCLEQ_ELM((head), (listelm), field)		\
+	(elm)->field.cqe_next = (listelm);				\
+	(elm)->field.cqe_prev = (listelm)->field.cqe_prev;		\
+	if ((listelm)->field.cqe_prev == CIRCLEQ_ENDC(head))		\
+		(head)->cqh_first = (elm);				\
+	else								\
+		(listelm)->field.cqe_prev->field.cqe_next = (elm);	\
+	(listelm)->field.cqe_prev = (elm);				\
+} while (/*CONSTCOND*/0)
+
+#define	CIRCLEQ_INSERT_HEAD(head, elm, field) do {			\
+	QUEUEDEBUG_CIRCLEQ_HEAD((head), field)				\
+	(elm)->field.cqe_next = (head)->cqh_first;			\
+	(elm)->field.cqe_prev = CIRCLEQ_END(head);			\
+	if ((head)->cqh_last == CIRCLEQ_ENDC(head))			\
+		(head)->cqh_last = (elm);				\
+	else								\
+		(head)->cqh_first->field.cqe_prev = (elm);		\
+	(head)->cqh_first = (elm);					\
+} while (/*CONSTCOND*/0)
+
+#define	CIRCLEQ_INSERT_TAIL(head, elm, field) do {			\
+	QUEUEDEBUG_CIRCLEQ_HEAD((head), field)				\
+	(elm)->field.cqe_next = CIRCLEQ_END(head);			\
+	(elm)->field.cqe_prev = (head)->cqh_last;			\
+	if ((head)->cqh_first == CIRCLEQ_ENDC(head))			\
+		(head)->cqh_first = (elm);				\
+	else								\
+		(head)->cqh_last->field.cqe_next = (elm);		\
+	(head)->cqh_last = (elm);					\
+} while (/*CONSTCOND*/0)
+
+#define	CIRCLEQ_REMOVE(head, elm, field) do {				\
+	QUEUEDEBUG_CIRCLEQ_HEAD((head), field)				\
+	QUEUEDEBUG_CIRCLEQ_ELM((head), (elm), field)			\
+	if ((elm)->field.cqe_next == CIRCLEQ_ENDC(head))		\
+		(head)->cqh_last = (elm)->field.cqe_prev;		\
+	else								\
+		(elm)->field.cqe_next->field.cqe_prev =			\
+		    (elm)->field.cqe_prev;				\
+	if ((elm)->field.cqe_prev == CIRCLEQ_ENDC(head))		\
+		(head)->cqh_first = (elm)->field.cqe_next;		\
+	else								\
+		(elm)->field.cqe_prev->field.cqe_next =			\
+		    (elm)->field.cqe_next;				\
+	QUEUEDEBUG_CIRCLEQ_POSTREMOVE((elm), field)			\
+} while (/*CONSTCOND*/0)
+
+#define	CIRCLEQ_FOREACH(var, head, field)				\
+	for ((var) = ((head)->cqh_first);				\
+		(var) != CIRCLEQ_ENDC(head);				\
+		(var) = ((var)->field.cqe_next))
+
+#define	CIRCLEQ_FOREACH_REVERSE(var, head, field)			\
+	for ((var) = ((head)->cqh_last);				\
+		(var) != CIRCLEQ_ENDC(head);				\
+		(var) = ((var)->field.cqe_prev))
+
+/*
+ * Circular queue access methods.
+ */
+#define	CIRCLEQ_FIRST(head)		((head)->cqh_first)
+#define	CIRCLEQ_LAST(head)		((head)->cqh_last)
+/* For comparisons */
+#define	CIRCLEQ_ENDC(head)		(__launder_type(head))
+/* For assignments */
+#define	CIRCLEQ_END(head)		((void *)(head))
+#define	CIRCLEQ_NEXT(elm, field)	((elm)->field.cqe_next)
+#define	CIRCLEQ_PREV(elm, field)	((elm)->field.cqe_prev)
+#define	CIRCLEQ_EMPTY(head)						\
+    (CIRCLEQ_FIRST(head) == CIRCLEQ_ENDC(head))
+
+#define CIRCLEQ_LOOP_NEXT(head, elm, field)				\
+	(((elm)->field.cqe_next == CIRCLEQ_ENDC(head))			\
+	    ? ((head)->cqh_first)					\
+	    : (elm->field.cqe_next))
+#define CIRCLEQ_LOOP_PREV(head, elm, field)				\
+	(((elm)->field.cqe_prev == CIRCLEQ_ENDC(head))			\
+	    ? ((head)->cqh_last)					\
+	    : (elm->field.cqe_prev))
+#endif /* !_KERNEL */
+
+#endif	/* !_SYS_QUEUE_H_ */
diff --git a/meta/recipes-core/bsd-headers/bsd-headers/sys-tree.h b/meta/recipes-core/bsd-headers/bsd-headers/sys-tree.h
new file mode 100644
index 0000000..eaea56a
--- /dev/null
+++ b/meta/recipes-core/bsd-headers/bsd-headers/sys-tree.h
@@ -0,0 +1,761 @@
+/*	$NetBSD: tree.h,v 1.20 2013/09/14 13:20:45 joerg Exp $	*/
+/*	$OpenBSD: tree.h,v 1.13 2011/07/09 00:19:45 pirofti Exp $	*/
+/*
+ * Copyright 2002 Niels Provos <provos@citi.umich.edu>
+ * All rights reserved.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
+ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
+ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
+ * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
+ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
+ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
+ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+#ifndef	_SYS_TREE_H_
+#define	_SYS_TREE_H_
+
+/*
+ * This file defines data structures for different types of trees:
+ * splay trees and red-black trees.
+ *
+ * A splay tree is a self-organizing data structure.  Every operation
+ * on the tree causes a splay to happen.  The splay moves the requested
+ * node to the root of the tree and partly rebalances it.
+ *
+ * This has the benefit that request locality causes faster lookups as
+ * the requested nodes move to the top of the tree.  On the other hand,
+ * every lookup causes memory writes.
+ *
+ * The Balance Theorem bounds the total access time for m operations
+ * and n inserts on an initially empty tree as O((m + n)lg n).  The
+ * amortized cost for a sequence of m accesses to a splay tree is O(lg n);
+ *
+ * A red-black tree is a binary search tree with the node color as an
+ * extra attribute.  It fulfills a set of conditions:
+ *	- every search path from the root to a leaf consists of the
+ *	  same number of black nodes,
+ *	- each red node (except for the root) has a black parent,
+ *	- each leaf node is black.
+ *
+ * Every operation on a red-black tree is bounded as O(lg n).
+ * The maximum height of a red-black tree is 2lg (n+1).
+ */
+
+#define SPLAY_HEAD(name, type)						\
+struct name {								\
+	struct type *sph_root; /* root of the tree */			\
+}
+
+#define SPLAY_INITIALIZER(root)						\
+	{ NULL }
+
+#define SPLAY_INIT(root) do {						\
+	(root)->sph_root = NULL;					\
+} while (/*CONSTCOND*/ 0)
+
+#define SPLAY_ENTRY(type)						\
+struct {								\
+	struct type *spe_left; /* left element */			\
+	struct type *spe_right; /* right element */			\
+}
+
+#define SPLAY_LEFT(elm, field)		(elm)->field.spe_left
+#define SPLAY_RIGHT(elm, field)		(elm)->field.spe_right
+#define SPLAY_ROOT(head)		(head)->sph_root
+#define SPLAY_EMPTY(head)		(SPLAY_ROOT(head) == NULL)
+
+/* SPLAY_ROTATE_{LEFT,RIGHT} expect that tmp hold SPLAY_{RIGHT,LEFT} */
+#define SPLAY_ROTATE_RIGHT(head, tmp, field) do {			\
+	SPLAY_LEFT((head)->sph_root, field) = SPLAY_RIGHT(tmp, field);	\
+	SPLAY_RIGHT(tmp, field) = (head)->sph_root;			\
+	(head)->sph_root = tmp;						\
+} while (/*CONSTCOND*/ 0)
+
+#define SPLAY_ROTATE_LEFT(head, tmp, field) do {			\
+	SPLAY_RIGHT((head)->sph_root, field) = SPLAY_LEFT(tmp, field);	\
+	SPLAY_LEFT(tmp, field) = (head)->sph_root;			\
+	(head)->sph_root = tmp;						\
+} while (/*CONSTCOND*/ 0)
+
+#define SPLAY_LINKLEFT(head, tmp, field) do {				\
+	SPLAY_LEFT(tmp, field) = (head)->sph_root;			\
+	tmp = (head)->sph_root;						\
+	(head)->sph_root = SPLAY_LEFT((head)->sph_root, field);		\
+} while (/*CONSTCOND*/ 0)
+
+#define SPLAY_LINKRIGHT(head, tmp, field) do {				\
+	SPLAY_RIGHT(tmp, field) = (head)->sph_root;			\
+	tmp = (head)->sph_root;						\
+	(head)->sph_root = SPLAY_RIGHT((head)->sph_root, field);	\
+} while (/*CONSTCOND*/ 0)
+
+#define SPLAY_ASSEMBLE(head, node, left, right, field) do {		\
+	SPLAY_RIGHT(left, field) = SPLAY_LEFT((head)->sph_root, field);	\
+	SPLAY_LEFT(right, field) = SPLAY_RIGHT((head)->sph_root, field);\
+	SPLAY_LEFT((head)->sph_root, field) = SPLAY_RIGHT(node, field);	\
+	SPLAY_RIGHT((head)->sph_root, field) = SPLAY_LEFT(node, field);	\
+} while (/*CONSTCOND*/ 0)
+
+/* Generates prototypes and inline functions */
+
+#define SPLAY_PROTOTYPE(name, type, field, cmp)				\
+void name##_SPLAY(struct name *, struct type *);			\
+void name##_SPLAY_MINMAX(struct name *, int);				\
+struct type *name##_SPLAY_INSERT(struct name *, struct type *);		\
+struct type *name##_SPLAY_REMOVE(struct name *, struct type *);		\
+									\
+/* Finds the node with the same key as elm */				\
+static __inline struct type *						\
+name##_SPLAY_FIND(struct name *head, struct type *elm)			\
+{									\
+	if (SPLAY_EMPTY(head))						\
+		return(NULL);						\
+	name##_SPLAY(head, elm);					\
+	if ((cmp)(elm, (head)->sph_root) == 0)				\
+		return (head->sph_root);				\
+	return (NULL);							\
+}									\
+									\
+static __inline __unused struct type *					\
+name##_SPLAY_NEXT(struct name *head, struct type *elm)			\
+{									\
+	name##_SPLAY(head, elm);					\
+	if (SPLAY_RIGHT(elm, field) != NULL) {				\
+		elm = SPLAY_RIGHT(elm, field);				\
+		while (SPLAY_LEFT(elm, field) != NULL) {		\
+			elm = SPLAY_LEFT(elm, field);			\
+		}							\
+	} else								\
+		elm = NULL;						\
+	return (elm);							\
+}									\
+									\
+static __unused __inline struct type *					\
+name##_SPLAY_MIN_MAX(struct name *head, int val)			\
+{									\
+	name##_SPLAY_MINMAX(head, val);					\
+        return (SPLAY_ROOT(head));					\
+}
+
+/* Main splay operation.
+ * Moves node close to the key of elm to top
+ */
+#define SPLAY_GENERATE(name, type, field, cmp)				\
+struct type *								\
+name##_SPLAY_INSERT(struct name *head, struct type *elm)		\
+{									\
+    if (SPLAY_EMPTY(head)) {						\
+	    SPLAY_LEFT(elm, field) = SPLAY_RIGHT(elm, field) = NULL;	\
+    } else {								\
+	    int __comp;							\
+	    name##_SPLAY(head, elm);					\
+	    __comp = (cmp)(elm, (head)->sph_root);			\
+	    if(__comp < 0) {						\
+		    SPLAY_LEFT(elm, field) = SPLAY_LEFT((head)->sph_root, field);\
+		    SPLAY_RIGHT(elm, field) = (head)->sph_root;		\
+		    SPLAY_LEFT((head)->sph_root, field) = NULL;		\
+	    } else if (__comp > 0) {					\
+		    SPLAY_RIGHT(elm, field) = SPLAY_RIGHT((head)->sph_root, field);\
+		    SPLAY_LEFT(elm, field) = (head)->sph_root;		\
+		    SPLAY_RIGHT((head)->sph_root, field) = NULL;	\
+	    } else							\
+		    return ((head)->sph_root);				\
+    }									\
+    (head)->sph_root = (elm);						\
+    return (NULL);							\
+}									\
+									\
+struct type *								\
+name##_SPLAY_REMOVE(struct name *head, struct type *elm)		\
+{									\
+	struct type *__tmp;						\
+	if (SPLAY_EMPTY(head))						\
+		return (NULL);						\
+	name##_SPLAY(head, elm);					\
+	if ((cmp)(elm, (head)->sph_root) == 0) {			\
+		if (SPLAY_LEFT((head)->sph_root, field) == NULL) {	\
+			(head)->sph_root = SPLAY_RIGHT((head)->sph_root, field);\
+		} else {						\
+			__tmp = SPLAY_RIGHT((head)->sph_root, field);	\
+			(head)->sph_root = SPLAY_LEFT((head)->sph_root, field);\
+			name##_SPLAY(head, elm);			\
+			SPLAY_RIGHT((head)->sph_root, field) = __tmp;	\
+		}							\
+		return (elm);						\
+	}								\
+	return (NULL);							\
+}									\
+									\
+void									\
+name##_SPLAY(struct name *head, struct type *elm)			\
+{									\
+	struct type __node, *__left, *__right, *__tmp;			\
+	int __comp;							\
+\
+	SPLAY_LEFT(&__node, field) = SPLAY_RIGHT(&__node, field) = NULL;\
+	__left = __right = &__node;					\
+\
+	while ((__comp = (cmp)(elm, (head)->sph_root)) != 0) {		\
+		if (__comp < 0) {					\
+			__tmp = SPLAY_LEFT((head)->sph_root, field);	\
+			if (__tmp == NULL)				\
+				break;					\
+			if ((cmp)(elm, __tmp) < 0){			\
+				SPLAY_ROTATE_RIGHT(head, __tmp, field);	\
+				if (SPLAY_LEFT((head)->sph_root, field) == NULL)\
+					break;				\
+			}						\
+			SPLAY_LINKLEFT(head, __right, field);		\
+		} else if (__comp > 0) {				\
+			__tmp = SPLAY_RIGHT((head)->sph_root, field);	\
+			if (__tmp == NULL)				\
+				break;					\
+			if ((cmp)(elm, __tmp) > 0){			\
+				SPLAY_ROTATE_LEFT(head, __tmp, field);	\
+				if (SPLAY_RIGHT((head)->sph_root, field) == NULL)\
+					break;				\
+			}						\
+			SPLAY_LINKRIGHT(head, __left, field);		\
+		}							\
+	}								\
+	SPLAY_ASSEMBLE(head, &__node, __left, __right, field);		\
+}									\
+									\
+/* Splay with either the minimum or the maximum element			\
+ * Used to find minimum or maximum element in tree.			\
+ */									\
+void name##_SPLAY_MINMAX(struct name *head, int __comp) \
+{									\
+	struct type __node, *__left, *__right, *__tmp;			\
+\
+	SPLAY_LEFT(&__node, field) = SPLAY_RIGHT(&__node, field) = NULL;\
+	__left = __right = &__node;					\
+\
+	while (1) {							\
+		if (__comp < 0) {					\
+			__tmp = SPLAY_LEFT((head)->sph_root, field);	\
+			if (__tmp == NULL)				\
+				break;					\
+			if (__comp < 0){				\
+				SPLAY_ROTATE_RIGHT(head, __tmp, field);	\
+				if (SPLAY_LEFT((head)->sph_root, field) == NULL)\
+					break;				\
+			}						\
+			SPLAY_LINKLEFT(head, __right, field);		\
+		} else if (__comp > 0) {				\
+			__tmp = SPLAY_RIGHT((head)->sph_root, field);	\
+			if (__tmp == NULL)				\
+				break;					\
+			if (__comp > 0) {				\
+				SPLAY_ROTATE_LEFT(head, __tmp, field);	\
+				if (SPLAY_RIGHT((head)->sph_root, field) == NULL)\
+					break;				\
+			}						\
+			SPLAY_LINKRIGHT(head, __left, field);		\
+		}							\
+	}								\
+	SPLAY_ASSEMBLE(head, &__node, __left, __right, field);		\
+}
+
+#define SPLAY_NEGINF	-1
+#define SPLAY_INF	1
+
+#define SPLAY_INSERT(name, x, y)	name##_SPLAY_INSERT(x, y)
+#define SPLAY_REMOVE(name, x, y)	name##_SPLAY_REMOVE(x, y)
+#define SPLAY_FIND(name, x, y)		name##_SPLAY_FIND(x, y)
+#define SPLAY_NEXT(name, x, y)		name##_SPLAY_NEXT(x, y)
+#define SPLAY_MIN(name, x)		(SPLAY_EMPTY(x) ? NULL	\
+					: name##_SPLAY_MIN_MAX(x, SPLAY_NEGINF))
+#define SPLAY_MAX(name, x)		(SPLAY_EMPTY(x) ? NULL	\
+					: name##_SPLAY_MIN_MAX(x, SPLAY_INF))
+
+#define SPLAY_FOREACH(x, name, head)					\
+	for ((x) = SPLAY_MIN(name, head);				\
+	     (x) != NULL;						\
+	     (x) = SPLAY_NEXT(name, head, x))
+
+/* Macros that define a red-black tree */
+#define RB_HEAD(name, type)						\
+struct name {								\
+	struct type *rbh_root; /* root of the tree */			\
+}
+
+#define RB_INITIALIZER(root)						\
+	{ NULL }
+
+#define RB_INIT(root) do {						\
+	(root)->rbh_root = NULL;					\
+} while (/*CONSTCOND*/ 0)
+
+#define RB_BLACK	0
+#define RB_RED		1
+#define RB_ENTRY(type)							\
+struct {								\
+	struct type *rbe_left;		/* left element */		\
+	struct type *rbe_right;		/* right element */		\
+	struct type *rbe_parent;	/* parent element */		\
+	int rbe_color;			/* node color */		\
+}
+
+#define RB_LEFT(elm, field)		(elm)->field.rbe_left
+#define RB_RIGHT(elm, field)		(elm)->field.rbe_right
+#define RB_PARENT(elm, field)		(elm)->field.rbe_parent
+#define RB_COLOR(elm, field)		(elm)->field.rbe_color
+#define RB_ROOT(head)			(head)->rbh_root
+#define RB_EMPTY(head)			(RB_ROOT(head) == NULL)
+
+#define RB_SET(elm, parent, field) do {					\
+	RB_PARENT(elm, field) = parent;					\
+	RB_LEFT(elm, field) = RB_RIGHT(elm, field) = NULL;		\
+	RB_COLOR(elm, field) = RB_RED;					\
+} while (/*CONSTCOND*/ 0)
+
+#define RB_SET_BLACKRED(black, red, field) do {				\
+	RB_COLOR(black, field) = RB_BLACK;				\
+	RB_COLOR(red, field) = RB_RED;					\
+} while (/*CONSTCOND*/ 0)
+
+#ifndef RB_AUGMENT
+#define RB_AUGMENT(x)	do {} while (/*CONSTCOND*/ 0)
+#endif
+
+#define RB_ROTATE_LEFT(head, elm, tmp, field) do {			\
+	(tmp) = RB_RIGHT(elm, field);					\
+	if ((RB_RIGHT(elm, field) = RB_LEFT(tmp, field)) != NULL) {	\
+		RB_PARENT(RB_LEFT(tmp, field), field) = (elm);		\
+	}								\
+	RB_AUGMENT(elm);						\
+	if ((RB_PARENT(tmp, field) = RB_PARENT(elm, field)) != NULL) {	\
+		if ((elm) == RB_LEFT(RB_PARENT(elm, field), field))	\
+			RB_LEFT(RB_PARENT(elm, field), field) = (tmp);	\
+		else							\
+			RB_RIGHT(RB_PARENT(elm, field), field) = (tmp);	\
+	} else								\
+		(head)->rbh_root = (tmp);				\
+	RB_LEFT(tmp, field) = (elm);					\
+	RB_PARENT(elm, field) = (tmp);					\
+	RB_AUGMENT(tmp);						\
+	if ((RB_PARENT(tmp, field)))					\
+		RB_AUGMENT(RB_PARENT(tmp, field));			\
+} while (/*CONSTCOND*/ 0)
+
+#define RB_ROTATE_RIGHT(head, elm, tmp, field) do {			\
+	(tmp) = RB_LEFT(elm, field);					\
+	if ((RB_LEFT(elm, field) = RB_RIGHT(tmp, field)) != NULL) {	\
+		RB_PARENT(RB_RIGHT(tmp, field), field) = (elm);		\
+	}								\
+	RB_AUGMENT(elm);						\
+	if ((RB_PARENT(tmp, field) = RB_PARENT(elm, field)) != NULL) {	\
+		if ((elm) == RB_LEFT(RB_PARENT(elm, field), field))	\
+			RB_LEFT(RB_PARENT(elm, field), field) = (tmp);	\
+		else							\
+			RB_RIGHT(RB_PARENT(elm, field), field) = (tmp);	\
+	} else								\
+		(head)->rbh_root = (tmp);				\
+	RB_RIGHT(tmp, field) = (elm);					\
+	RB_PARENT(elm, field) = (tmp);					\
+	RB_AUGMENT(tmp);						\
+	if ((RB_PARENT(tmp, field)))					\
+		RB_AUGMENT(RB_PARENT(tmp, field));			\
+} while (/*CONSTCOND*/ 0)
+
+/* Generates prototypes and inline functions */
+#define RB_PROTOTYPE(name, type, field, cmp)				\
+	RB_PROTOTYPE_INTERNAL(name, type, field, cmp,)
+#define	RB_PROTOTYPE_STATIC(name, type, field, cmp)			\
+	RB_PROTOTYPE_INTERNAL(name, type, field, cmp, __unused static)
+#define RB_PROTOTYPE_INTERNAL(name, type, field, cmp, attr)		\
+attr void name##_RB_INSERT_COLOR(struct name *, struct type *);		\
+attr void name##_RB_REMOVE_COLOR(struct name *, struct type *, struct type *);\
+attr struct type *name##_RB_REMOVE(struct name *, struct type *);	\
+attr struct type *name##_RB_INSERT(struct name *, struct type *);	\
+attr struct type *name##_RB_FIND(struct name *, struct type *);		\
+attr struct type *name##_RB_NFIND(struct name *, struct type *);	\
+attr struct type *name##_RB_NEXT(struct type *);			\
+attr struct type *name##_RB_PREV(struct type *);			\
+attr struct type *name##_RB_MINMAX(struct name *, int);			\
+									\
+
+/* Main rb operation.
+ * Moves node close to the key of elm to top
+ */
+#define	RB_GENERATE(name, type, field, cmp)				\
+	RB_GENERATE_INTERNAL(name, type, field, cmp,)
+#define	RB_GENERATE_STATIC(name, type, field, cmp)			\
+	RB_GENERATE_INTERNAL(name, type, field, cmp, __unused static)
+#define RB_GENERATE_INTERNAL(name, type, field, cmp, attr)		\
+attr void								\
+name##_RB_INSERT_COLOR(struct name *head, struct type *elm)		\
+{									\
+	struct type *parent, *gparent, *tmp;				\
+	while ((parent = RB_PARENT(elm, field)) != NULL &&		\
+	    RB_COLOR(parent, field) == RB_RED) {			\
+		gparent = RB_PARENT(parent, field);			\
+		if (parent == RB_LEFT(gparent, field)) {		\
+			tmp = RB_RIGHT(gparent, field);			\
+			if (tmp && RB_COLOR(tmp, field) == RB_RED) {	\
+				RB_COLOR(tmp, field) = RB_BLACK;	\
+				RB_SET_BLACKRED(parent, gparent, field);\
+				elm = gparent;				\
+				continue;				\
+			}						\
+			if (RB_RIGHT(parent, field) == elm) {		\
+				RB_ROTATE_LEFT(head, parent, tmp, field);\
+				tmp = parent;				\
+				parent = elm;				\
+				elm = tmp;				\
+			}						\
+			RB_SET_BLACKRED(parent, gparent, field);	\
+			RB_ROTATE_RIGHT(head, gparent, tmp, field);	\
+		} else {						\
+			tmp = RB_LEFT(gparent, field);			\
+			if (tmp && RB_COLOR(tmp, field) == RB_RED) {	\
+				RB_COLOR(tmp, field) = RB_BLACK;	\
+				RB_SET_BLACKRED(parent, gparent, field);\
+				elm = gparent;				\
+				continue;				\
+			}						\
+			if (RB_LEFT(parent, field) == elm) {		\
+				RB_ROTATE_RIGHT(head, parent, tmp, field);\
+				tmp = parent;				\
+				parent = elm;				\
+				elm = tmp;				\
+			}						\
+			RB_SET_BLACKRED(parent, gparent, field);	\
+			RB_ROTATE_LEFT(head, gparent, tmp, field);	\
+		}							\
+	}								\
+	RB_COLOR(head->rbh_root, field) = RB_BLACK;			\
+}									\
+									\
+attr void								\
+name##_RB_REMOVE_COLOR(struct name *head, struct type *parent, struct type *elm) \
+{									\
+	struct type *tmp;						\
+	while ((elm == NULL || RB_COLOR(elm, field) == RB_BLACK) &&	\
+	    elm != RB_ROOT(head)) {					\
+		if (RB_LEFT(parent, field) == elm) {			\
+			tmp = RB_RIGHT(parent, field);			\
+			if (RB_COLOR(tmp, field) == RB_RED) {		\
+				RB_SET_BLACKRED(tmp, parent, field);	\
+				RB_ROTATE_LEFT(head, parent, tmp, field);\
+				tmp = RB_RIGHT(parent, field);		\
+			}						\
+			if ((RB_LEFT(tmp, field) == NULL ||		\
+			    RB_COLOR(RB_LEFT(tmp, field), field) == RB_BLACK) &&\
+			    (RB_RIGHT(tmp, field) == NULL ||		\
+			    RB_COLOR(RB_RIGHT(tmp, field), field) == RB_BLACK)) {\
+				RB_COLOR(tmp, field) = RB_RED;		\
+				elm = parent;				\
+				parent = RB_PARENT(elm, field);		\
+			} else {					\
+				if (RB_RIGHT(tmp, field) == NULL ||	\
+				    RB_COLOR(RB_RIGHT(tmp, field), field) == RB_BLACK) {\
+					struct type *oleft;		\
+					if ((oleft = RB_LEFT(tmp, field)) \
+					    != NULL)			\
+						RB_COLOR(oleft, field) = RB_BLACK;\
+					RB_COLOR(tmp, field) = RB_RED;	\
+					RB_ROTATE_RIGHT(head, tmp, oleft, field);\
+					tmp = RB_RIGHT(parent, field);	\
+				}					\
+				RB_COLOR(tmp, field) = RB_COLOR(parent, field);\
+				RB_COLOR(parent, field) = RB_BLACK;	\
+				if (RB_RIGHT(tmp, field))		\
+					RB_COLOR(RB_RIGHT(tmp, field), field) = RB_BLACK;\
+				RB_ROTATE_LEFT(head, parent, tmp, field);\
+				elm = RB_ROOT(head);			\
+				break;					\
+			}						\
+		} else {						\
+			tmp = RB_LEFT(parent, field);			\
+			if (RB_COLOR(tmp, field) == RB_RED) {		\
+				RB_SET_BLACKRED(tmp, parent, field);	\
+				RB_ROTATE_RIGHT(head, parent, tmp, field);\
+				tmp = RB_LEFT(parent, field);		\
+			}						\
+			if ((RB_LEFT(tmp, field) == NULL ||		\
+			    RB_COLOR(RB_LEFT(tmp, field), field) == RB_BLACK) &&\
+			    (RB_RIGHT(tmp, field) == NULL ||		\
+			    RB_COLOR(RB_RIGHT(tmp, field), field) == RB_BLACK)) {\
+				RB_COLOR(tmp, field) = RB_RED;		\
+				elm = parent;				\
+				parent = RB_PARENT(elm, field);		\
+			} else {					\
+				if (RB_LEFT(tmp, field) == NULL ||	\
+				    RB_COLOR(RB_LEFT(tmp, field), field) == RB_BLACK) {\
+					struct type *oright;		\
+					if ((oright = RB_RIGHT(tmp, field)) \
+					    != NULL)			\
+						RB_COLOR(oright, field) = RB_BLACK;\
+					RB_COLOR(tmp, field) = RB_RED;	\
+					RB_ROTATE_LEFT(head, tmp, oright, field);\
+					tmp = RB_LEFT(parent, field);	\
+				}					\
+				RB_COLOR(tmp, field) = RB_COLOR(parent, field);\
+				RB_COLOR(parent, field) = RB_BLACK;	\
+				if (RB_LEFT(tmp, field))		\
+					RB_COLOR(RB_LEFT(tmp, field), field) = RB_BLACK;\
+				RB_ROTATE_RIGHT(head, parent, tmp, field);\
+				elm = RB_ROOT(head);			\
+				break;					\
+			}						\
+		}							\
+	}								\
+	if (elm)							\
+		RB_COLOR(elm, field) = RB_BLACK;			\
+}									\
+									\
+attr struct type *							\
+name##_RB_REMOVE(struct name *head, struct type *elm)			\
+{									\
+	struct type *child, *parent, *old = elm;			\
+	int color;							\
+	if (RB_LEFT(elm, field) == NULL)				\
+		child = RB_RIGHT(elm, field);				\
+	else if (RB_RIGHT(elm, field) == NULL)				\
+		child = RB_LEFT(elm, field);				\
+	else {								\
+		struct type *left;					\
+		elm = RB_RIGHT(elm, field);				\
+		while ((left = RB_LEFT(elm, field)) != NULL)		\
+			elm = left;					\
+		child = RB_RIGHT(elm, field);				\
+		parent = RB_PARENT(elm, field);				\
+		color = RB_COLOR(elm, field);				\
+		if (child)						\
+			RB_PARENT(child, field) = parent;		\
+		if (parent) {						\
+			if (RB_LEFT(parent, field) == elm)		\
+				RB_LEFT(parent, field) = child;		\
+			else						\
+				RB_RIGHT(parent, field) = child;	\
+			RB_AUGMENT(parent);				\
+		} else							\
+			RB_ROOT(head) = child;				\
+		if (RB_PARENT(elm, field) == old)			\
+			parent = elm;					\
+		(elm)->field = (old)->field;				\
+		if (RB_PARENT(old, field)) {				\
+			if (RB_LEFT(RB_PARENT(old, field), field) == old)\
+				RB_LEFT(RB_PARENT(old, field), field) = elm;\
+			else						\
+				RB_RIGHT(RB_PARENT(old, field), field) = elm;\
+			RB_AUGMENT(RB_PARENT(old, field));		\
+		} else							\
+			RB_ROOT(head) = elm;				\
+		RB_PARENT(RB_LEFT(old, field), field) = elm;		\
+		if (RB_RIGHT(old, field))				\
+			RB_PARENT(RB_RIGHT(old, field), field) = elm;	\
+		if (parent) {						\
+			left = parent;					\
+			do {						\
+				RB_AUGMENT(left);			\
+			} while ((left = RB_PARENT(left, field)) != NULL); \
+		}							\
+		goto color;						\
+	}								\
+	parent = RB_PARENT(elm, field);					\
+	color = RB_COLOR(elm, field);					\
+	if (child)							\
+		RB_PARENT(child, field) = parent;			\
+	if (parent) {							\
+		if (RB_LEFT(parent, field) == elm)			\
+			RB_LEFT(parent, field) = child;			\
+		else							\
+			RB_RIGHT(parent, field) = child;		\
+		RB_AUGMENT(parent);					\
+	} else								\
+		RB_ROOT(head) = child;					\
+color:									\
+	if (color == RB_BLACK)						\
+		name##_RB_REMOVE_COLOR(head, parent, child);		\
+	return (old);							\
+}									\
+									\
+/* Inserts a node into the RB tree */					\
+attr struct type *							\
+name##_RB_INSERT(struct name *head, struct type *elm)			\
+{									\
+	struct type *tmp;						\
+	struct type *parent = NULL;					\
+	int comp = 0;							\
+	tmp = RB_ROOT(head);						\
+	while (tmp) {							\
+		parent = tmp;						\
+		comp = (cmp)(elm, parent);				\
+		if (comp < 0)						\
+			tmp = RB_LEFT(tmp, field);			\
+		else if (comp > 0)					\
+			tmp = RB_RIGHT(tmp, field);			\
+		else							\
+			return (tmp);					\
+	}								\
+	RB_SET(elm, parent, field);					\
+	if (parent != NULL) {						\
+		if (comp < 0)						\
+			RB_LEFT(parent, field) = elm;			\
+		else							\
+			RB_RIGHT(parent, field) = elm;			\
+		RB_AUGMENT(parent);					\
+	} else								\
+		RB_ROOT(head) = elm;					\
+	name##_RB_INSERT_COLOR(head, elm);				\
+	return (NULL);							\
+}									\
+									\
+/* Finds the node with the same key as elm */				\
+attr struct type *							\
+name##_RB_FIND(struct name *head, struct type *elm)			\
+{									\
+	struct type *tmp = RB_ROOT(head);				\
+	int comp;							\
+	while (tmp) {							\
+		comp = cmp(elm, tmp);					\
+		if (comp < 0)						\
+			tmp = RB_LEFT(tmp, field);			\
+		else if (comp > 0)					\
+			tmp = RB_RIGHT(tmp, field);			\
+		else							\
+			return (tmp);					\
+	}								\
+	return (NULL);							\
+}									\
+									\
+/* Finds the first node greater than or equal to the search key */	\
+attr struct type *							\
+name##_RB_NFIND(struct name *head, struct type *elm)			\
+{									\
+	struct type *tmp = RB_ROOT(head);				\
+	struct type *res = NULL;					\
+	int comp;							\
+	while (tmp) {							\
+		comp = cmp(elm, tmp);					\
+		if (comp < 0) {						\
+			res = tmp;					\
+			tmp = RB_LEFT(tmp, field);			\
+		}							\
+		else if (comp > 0)					\
+			tmp = RB_RIGHT(tmp, field);			\
+		else							\
+			return (tmp);					\
+	}								\
+	return (res);							\
+}									\
+									\
+/* ARGSUSED */								\
+attr struct type *							\
+name##_RB_NEXT(struct type *elm)					\
+{									\
+	if (RB_RIGHT(elm, field)) {					\
+		elm = RB_RIGHT(elm, field);				\
+		while (RB_LEFT(elm, field))				\
+			elm = RB_LEFT(elm, field);			\
+	} else {							\
+		if (RB_PARENT(elm, field) &&				\
+		    (elm == RB_LEFT(RB_PARENT(elm, field), field)))	\
+			elm = RB_PARENT(elm, field);			\
+		else {							\
+			while (RB_PARENT(elm, field) &&			\
+			    (elm == RB_RIGHT(RB_PARENT(elm, field), field)))\
+				elm = RB_PARENT(elm, field);		\
+			elm = RB_PARENT(elm, field);			\
+		}							\
+	}								\
+	return (elm);							\
+}									\
+									\
+/* ARGSUSED */								\
+attr struct type *							\
+name##_RB_PREV(struct type *elm)					\
+{									\
+	if (RB_LEFT(elm, field)) {					\
+		elm = RB_LEFT(elm, field);				\
+		while (RB_RIGHT(elm, field))				\
+			elm = RB_RIGHT(elm, field);			\
+	} else {							\
+		if (RB_PARENT(elm, field) &&				\
+		    (elm == RB_RIGHT(RB_PARENT(elm, field), field)))	\
+			elm = RB_PARENT(elm, field);			\
+		else {							\
+			while (RB_PARENT(elm, field) &&			\
+			    (elm == RB_LEFT(RB_PARENT(elm, field), field)))\
+				elm = RB_PARENT(elm, field);		\
+			elm = RB_PARENT(elm, field);			\
+		}							\
+	}								\
+	return (elm);							\
+}									\
+									\
+attr struct type *							\
+name##_RB_MINMAX(struct name *head, int val)				\
+{									\
+	struct type *tmp = RB_ROOT(head);				\
+	struct type *parent = NULL;					\
+	while (tmp) {							\
+		parent = tmp;						\
+		if (val < 0)						\
+			tmp = RB_LEFT(tmp, field);			\
+		else							\
+			tmp = RB_RIGHT(tmp, field);			\
+	}								\
+	return (parent);						\
+}
+
+#define RB_NEGINF	-1
+#define RB_INF	1
+
+#define RB_INSERT(name, x, y)	name##_RB_INSERT(x, y)
+#define RB_REMOVE(name, x, y)	name##_RB_REMOVE(x, y)
+#define RB_FIND(name, x, y)	name##_RB_FIND(x, y)
+#define RB_NFIND(name, x, y)	name##_RB_NFIND(x, y)
+#define RB_NEXT(name, x, y)	name##_RB_NEXT(y)
+#define RB_PREV(name, x, y)	name##_RB_PREV(y)
+#define RB_MIN(name, x)		name##_RB_MINMAX(x, RB_NEGINF)
+#define RB_MAX(name, x)		name##_RB_MINMAX(x, RB_INF)
+
+#define RB_FOREACH(x, name, head)					\
+	for ((x) = RB_MIN(name, head);					\
+	     (x) != NULL;						\
+	     (x) = name##_RB_NEXT(x))
+
+#define RB_FOREACH_FROM(x, name, y)					\
+	for ((x) = (y);							\
+	    ((x) != NULL) && ((y) = name##_RB_NEXT(x), (x) != NULL);	\
+	     (x) = (y))
+
+#define RB_FOREACH_SAFE(x, name, head, y)				\
+	for ((x) = RB_MIN(name, head);					\
+	    ((x) != NULL) && ((y) = name##_RB_NEXT(x), (x) != NULL);	\
+	     (x) = (y))
+
+#define RB_FOREACH_REVERSE(x, name, head)				\
+	for ((x) = RB_MAX(name, head);					\
+	     (x) != NULL;						\
+	     (x) = name##_RB_PREV(x))
+
+#define RB_FOREACH_REVERSE_FROM(x, name, y)				\
+	for ((x) = (y);							\
+	    ((x) != NULL) && ((y) = name##_RB_PREV(x), (x) != NULL);	\
+	     (x) = (y))
+
+#define RB_FOREACH_REVERSE_SAFE(x, name, head, y)			\
+	for ((x) = RB_MAX(name, head);					\
+	    ((x) != NULL) && ((y) = name##_RB_PREV(x), (x) != NULL);	\
+	     (x) = (y))
+
+#endif	/* _SYS_TREE_H_ */
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 051d925..5b94d1f 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -19,6 +19,7 @@ PROVIDES += "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc virtual/libiconv
 DEPENDS = "virtual/${TARGET_PREFIX}binutils \
            virtual/${TARGET_PREFIX}gcc-initial \
            libgcc-initial \
+           bsd-headers \
           "
 
 export CROSS_COMPILE="${TARGET_PREFIX}"
-- 
2.7.0


