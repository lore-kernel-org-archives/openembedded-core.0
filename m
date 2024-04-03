Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DC22CD129A
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 03:47:24 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.3153.1712116043887177932
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Apr 2024 20:47:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xOPvYXSY;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1def3340682so51208025ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 20:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1712116043; x=1712720843; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Ph0czHdOf2Qeclxwvzh9biefYclXK0tLGws/Hnaq6Y=;
        b=xOPvYXSYPzMhcQRVLnxLKUtIzeuBY7n9UYSiwLT+asNdCxK8SJKUDzwYcni7VYIJp0
         dvV+8eAJc38jCCt7+grhEzY1adoT/Av9wSS/1xxYjyBomqDEMu+x25PShG9O8hFSyj4z
         YgCkIhm8RkFu5oNjAsSYQSob/o5QeJgc7MpYKqUAZyGenJjkgxA7b9lZ2ULBKxXJo7Ib
         CcD5xSs4Hw7F0q4Ok/sZo7Zq+jRkm1yqzskXZmzfPBnvuaRHGScEcWDQ44jUCJQNMByg
         W5yk6x+vsXG6rHwG0V6q3j8efng63C0CB2lga6lkc8O41kcgLROIaB4BoBAx1BauRpNl
         i3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712116043; x=1712720843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Ph0czHdOf2Qeclxwvzh9biefYclXK0tLGws/Hnaq6Y=;
        b=ey6jFAD9OUHOYvztztf41VfAVwOC21nvVGBK0YO+JlCnUlAbj1GBm2cjd3O58NFxLY
         jbOd2/IVAg9lVywym0BVPpBQhUvkndnkpLEnyqEtKopyvWrcUZUO3zf8QZC+g7q1xfGn
         QIzq5M9Oi8BvicIKjZNlV68JdccwQMXl8zHs90x11x569d+t1JCEChuD3ar8VAxaugTv
         syKoGPZebSYfYGCSgNLlR4zE5q9romF9YdosJLkb97+t54y/OuchK+SkZ4tiV6NtKxsz
         8aHTH+yYmMjhMMmDOWPM0xu/R+OGX4L5dXjl/t5b+5BsZUqyG2lBKAQFQg3v74Z4/RHT
         OtxQ==
X-Gm-Message-State: AOJu0YxYKdoOHb4PsHyVZWNNCl5bODaJhVTcKUS5VmAVrvXknO8KOmNx
	dij2tqFBpBeI53YqJLNIUI9IKi7tcpMpSHqBsp95jcLUrjbEXSdsqehH13A74Tq//r5cgjoYLC+
	SLDg=
X-Google-Smtp-Source: AGHT+IG/SOSTFV5h7uK34uSOUQZkQomNG59uFnwAV6bvGdSlRw4otGdVajAFn5Te8+LFateqjiJpjQ==
X-Received: by 2002:a17:903:24c:b0:1e2:573:eef7 with SMTP id j12-20020a170903024c00b001e20573eef7mr19540511plh.0.1712116043116;
        Tue, 02 Apr 2024 20:47:23 -0700 (PDT)
Received: from xps13.. (067-053-223-136.biz.spectrum.com. [67.53.223.136])
        by smtp.gmail.com with ESMTPSA id m11-20020a170902c44b00b001e278fb17c5sm2326128plm.150.2024.04.02.20.47.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 20:47:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 9/9] common-licenses: Backport missing license
Date: Tue,  2 Apr 2024 17:47:02 -1000
Message-Id: <26a878cbfbb3bc7a6e892e105577ebf8138ce150.1712115855.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712115855.git.steve@sakoman.com>
References: <cover.1712115855.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 03:47:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197902

From: Colin McAllister <colin.mcallister@garmin.com>

Backports missing license from master to kirkstone.

Signed-off-by: Colin McAllister <colin.mcallister@garmin.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../LGPL-3.0-with-zeromq-exception            | 181 ++++++++++++++++++
 1 file changed, 181 insertions(+)
 create mode 100644 meta/files/common-licenses/LGPL-3.0-with-zeromq-exception

diff --git a/meta/files/common-licenses/LGPL-3.0-with-zeromq-exception b/meta/files/common-licenses/LGPL-3.0-with-zeromq-exception
new file mode 100644
index 0000000000..02e943c4ac
--- /dev/null
+++ b/meta/files/common-licenses/LGPL-3.0-with-zeromq-exception
@@ -0,0 +1,181 @@
+		         GNU LESSER GENERAL PUBLIC LICENSE
+                       Version 3, 29 June 2007
+
+ Copyright (C) 2007 Free Software Foundation, Inc. <http://fsf.org/>
+ Everyone is permitted to copy and distribute verbatim copies
+ of this license document, but changing it is not allowed.
+
+
+  This version of the GNU Lesser General Public License incorporates
+the terms and conditions of version 3 of the GNU General Public
+License, supplemented by the additional permissions listed below.
+
+  0. Additional Definitions. 
+
+  As used herein, "this License" refers to version 3 of the GNU Lesser
+General Public License, and the "GNU GPL" refers to version 3 of the GNU
+General Public License.
+
+  "The Library" refers to a covered work governed by this License,
+other than an Application or a Combined Work as defined below.
+
+  An "Application" is any work that makes use of an interface provided
+by the Library, but which is not otherwise based on the Library.
+Defining a subclass of a class defined by the Library is deemed a mode
+of using an interface provided by the Library.
+
+  A "Combined Work" is a work produced by combining or linking an
+Application with the Library.  The particular version of the Library
+with which the Combined Work was made is also called the "Linked
+Version".
+
+  The "Minimal Corresponding Source" for a Combined Work means the
+Corresponding Source for the Combined Work, excluding any source code
+for portions of the Combined Work that, considered in isolation, are
+based on the Application, and not on the Linked Version.
+
+  The "Corresponding Application Code" for a Combined Work means the
+object code and/or source code for the Application, including any data
+and utility programs needed for reproducing the Combined Work from the
+Application, but excluding the System Libraries of the Combined Work.
+
+  1. Exception to Section 3 of the GNU GPL.
+
+  You may convey a covered work under sections 3 and 4 of this License
+without being bound by section 3 of the GNU GPL.
+
+  2. Conveying Modified Versions.
+
+  If you modify a copy of the Library, and, in your modifications, a
+facility refers to a function or data to be supplied by an Application
+that uses the facility (other than as an argument passed when the
+facility is invoked), then you may convey a copy of the modified
+version:
+
+   a) under this License, provided that you make a good faith effort to
+   ensure that, in the event an Application does not supply the
+   function or data, the facility still operates, and performs
+   whatever part of its purpose remains meaningful, or
+
+   b) under the GNU GPL, with none of the additional permissions of
+   this License applicable to that copy.
+
+  3. Object Code Incorporating Material from Library Header Files.
+
+  The object code form of an Application may incorporate material from
+a header file that is part of the Library.  You may convey such object
+code under terms of your choice, provided that, if the incorporated
+material is not limited to numerical parameters, data structure
+layouts and accessors, or small macros, inline functions and templates
+(ten or fewer lines in length), you do both of the following:
+
+   a) Give prominent notice with each copy of the object code that the
+   Library is used in it and that the Library and its use are
+   covered by this License.
+
+   b) Accompany the object code with a copy of the GNU GPL and this license
+   document.
+
+  4. Combined Works.
+
+  You may convey a Combined Work under terms of your choice that,
+taken together, effectively do not restrict modification of the
+portions of the Library contained in the Combined Work and reverse
+engineering for debugging such modifications, if you also do each of
+the following:
+
+   a) Give prominent notice with each copy of the Combined Work that
+   the Library is used in it and that the Library and its use are
+   covered by this License.
+
+   b) Accompany the Combined Work with a copy of the GNU GPL and this license
+   document.
+
+   c) For a Combined Work that displays copyright notices during
+   execution, include the copyright notice for the Library among
+   these notices, as well as a reference directing the user to the
+   copies of the GNU GPL and this license document.
+
+   d) Do one of the following:
+
+       0) Convey the Minimal Corresponding Source under the terms of this
+       License, and the Corresponding Application Code in a form
+       suitable for, and under terms that permit, the user to
+       recombine or relink the Application with a modified version of
+       the Linked Version to produce a modified Combined Work, in the
+       manner specified by section 6 of the GNU GPL for conveying
+       Corresponding Source.
+
+       1) Use a suitable shared library mechanism for linking with the
+       Library.  A suitable mechanism is one that (a) uses at run time
+       a copy of the Library already present on the user's computer
+       system, and (b) will operate properly with a modified version
+       of the Library that is interface-compatible with the Linked
+       Version. 
+
+   e) Provide Installation Information, but only if you would otherwise
+   be required to provide such information under section 6 of the
+   GNU GPL, and only to the extent that such information is
+   necessary to install and execute a modified version of the
+   Combined Work produced by recombining or relinking the
+   Application with a modified version of the Linked Version. (If
+   you use option 4d0, the Installation Information must accompany
+   the Minimal Corresponding Source and Corresponding Application
+   Code. If you use option 4d1, you must provide the Installation
+   Information in the manner specified by section 6 of the GNU GPL
+   for conveying Corresponding Source.)
+
+  5. Combined Libraries.
+
+  You may place library facilities that are a work based on the
+Library side by side in a single library together with other library
+facilities that are not Applications and are not covered by this
+License, and convey such a combined library under terms of your
+choice, if you do both of the following:
+
+   a) Accompany the combined library with a copy of the same work based
+   on the Library, uncombined with any other library facilities,
+   conveyed under the terms of this License.
+
+   b) Give prominent notice with the combined library that part of it
+   is a work based on the Library, and explaining where to find the
+   accompanying uncombined form of the same work.
+
+  6. Revised Versions of the GNU Lesser General Public License.
+
+  The Free Software Foundation may publish revised and/or new versions
+of the GNU Lesser General Public License from time to time. Such new
+versions will be similar in spirit to the present version, but may
+differ in detail to address new problems or concerns.
+
+  Each version is given a distinguishing version number. If the
+Library as you received it specifies that a certain numbered version
+of the GNU Lesser General Public License "or any later version"
+applies to it, you have the option of following the terms and
+conditions either of that published version or of any later version
+published by the Free Software Foundation. If the Library as you
+received it does not specify a version number of the GNU Lesser
+General Public License, you may choose any version of the GNU Lesser
+General Public License ever published by the Free Software Foundation.
+
+  If the Library as you received it specifies that a proxy can decide
+whether future versions of the GNU Lesser General Public License shall
+apply, that proxy's public statement of acceptance of any version is
+permanent authorization for you to choose that version for the
+Library.
+
+--------------------------------------------------------------------------------
+
+           SPECIAL EXCEPTION GRANTED BY COPYRIGHT HOLDERS
+
+As a special exception, copyright holders give you permission to link this
+library with independent modules to produce an executable, regardless of
+the license terms of these independent modules, and to copy and distribute
+the resulting executable under terms of your choice, provided that you also
+meet, for each linked independent module, the terms and conditions of
+the license of that module. An independent module is a module which is not
+derived from or based on this library. If you modify this library, you must
+extend this exception to your version of the library.
+
+Note: this exception relieves you of any obligations under sections 4 and 5
+of this license, and section 6 of the GNU General Public License.
-- 
2.34.1


