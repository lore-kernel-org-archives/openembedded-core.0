Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7465A60685
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 05:01:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w5151GrK014646
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 22:01:16 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Thu, 31 May 2018 22:01:15 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Jun 2018 13:03:00 +0800
Message-ID: <ea94ff4788d57a1b714add9389ccc944ebb5af4b.1527829100.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1527829099.git.Qi.Chen@windriver.com>
References: <cover.1527829099.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 03/14] oeqa/core/decorator/__init__.py: set metaclass to ABCMeta
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
X-List-Received-Date: Fri, 01 Jun 2018 05:01:15 -0000
Content-Type: text/plain

OETestFilter is a subclass of OETestDecorator. It wants to make
use of @abstractmethod decorator. But such decorator requires
metaclass to be ABCMeta to have effect. So add it now to achieve
the designed behaviour.

Comments from python's manual:
"""
Using this decorator requires that the class's metaclass is ABCMeta
or is derived from it.
"""

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/core/decorator/__init__.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/core/decorator/__init__.py b/meta/lib/oeqa/core/decorator/__init__.py
index 855b6b9..6ca0acf 100644
--- a/meta/lib/oeqa/core/decorator/__init__.py
+++ b/meta/lib/oeqa/core/decorator/__init__.py
@@ -2,7 +2,7 @@
 # Released under the MIT license (see COPYING.MIT)
 
 from functools import wraps
-from abc import abstractmethod
+from abc import abstractmethod, ABCMeta
 
 decoratorClasses = set()
 
@@ -10,7 +10,7 @@ def registerDecorator(obj):
     decoratorClasses.add(obj)
     return obj
 
-class OETestDecorator(object):
+class OETestDecorator(object, metaclass=ABCMeta):
     case = None # Reference of OETestCase decorated
     attrs = None # Attributes to be loaded by decorator implementation
 
-- 
1.9.1


