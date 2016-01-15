Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5C096731D1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 12:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0FCMtSN019795; Fri, 15 Jan 2016 12:22:55 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id DbXYgFwb3CWZ; Fri, 15 Jan 2016 12:22:55 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0FCMqGF019792
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 15 Jan 2016 12:22:54 GMT
Message-ID: <1452860572.28375.148.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 15 Jan 2016 12:22:52 +0000
In-Reply-To: <542ae24027e42b3a3c037341ecdc99eb77e412d8.1452824092.git.liezhi.yang@windriver.com>
References: <cover.1452824092.git.liezhi.yang@windriver.com>
	<542ae24027e42b3a3c037341ecdc99eb77e412d8.1452824092.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] insane.bbclass: make package_qa_walk() can print all the messages
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
X-List-Received-Date: Fri, 15 Jan 2016 12:22:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-01-14 at 18:15 -0800, Robert Yang wrote:
> * If more than one files have the same QA issue, package_qa_walk()
> can
>   only print the last one, others are overrided, for example:
>   messages["host-user-contaminated"] = "foo1"
>   messages["host-user-contaminated"] = "foo2"
>   Only foo2 will be printed, this patch fixes the issue.
> 
> * Remove unused parameter "path" from package_qa_walk()
>   The path is a useless parameter in package_qa_walk() since it has
> been
>   redined inside.
> 
> [YOCTO #8436]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/insane.bbclass |   20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)

Whilst your proposal is self contained, it doesn't really do anything
to help the readability of this code which is pretty horrific already,
if anything it just makes the code even more convoluted. I'd propose
something more radical, like:

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index acf8639..03028f8 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -189,6 +189,12 @@ def package_qa_handle_error(error_class, error_msg, d):
         bb.note("QA Issue: %s [%s]" % (error_msg, error_class))
     return True
 
+def package_qa_add_message(messages, section, message):
+    if section not in messages:
+        messages[section] = message
+    else:
+        messages[section] = messages[section] + "\n" + message
+
 QAPATHTEST[libexec] = "package_qa_check_libexec"
 def package_qa_check_libexec(path,name, d, elf, messages):
 
@@ -198,7 +204,7 @@ def package_qa_check_libexec(path,name, d, elf, messages):
         return True
 
     if 'libexec' in path.split(os.path.sep):
-        messages["libexec"] = "%s: %s is using libexec please relocate to %s" % (name, package_qa_clean_path(path, d), libexec)
+        package_qa_add_message(messages, "libexec", "%s: %s is using libexec please relocate to %s" % (name, package_qa_clean_path(path, d), libexec))
         return False
 
     return True


This will obviously be a bit more work to make the patch but will IMO
result in a cleaner piece of code as an end result.

Cheers,

Richard

