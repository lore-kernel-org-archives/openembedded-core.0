Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SCCHF-0001WY-Oq
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 17:56:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 30A5D315A804;
	Mon, 26 Mar 2012 17:47:16 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id tdgMEYNvjk8L; Mon, 26 Mar 2012 17:47:05 +0200 (CEST)
Received: from [172.22.22.61] (drms-590c5e52.pool.mediaWays.net [89.12.94.82])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 69EFC315A801;
	Mon, 26 Mar 2012 17:47:05 +0200 (CEST)
Message-ID: <4F708F78.4020502@opendreambox.org>
Date: Mon, 26 Mar 2012 17:47:04 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120310 Thunderbird/11.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1331345726-9577-1-git-send-email-obi@opendreambox.org>
	<4F5E1672.7090706@windriver.com> <1331567634.15192.20.camel@ted>
	<4F6CDA62.3070908@opendreambox.org>
	<1332761648.28414.113.camel@ted>
In-Reply-To: <1332761648.28414.113.camel@ted>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package_ipk: apply umask to control and conffiles
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
X-List-Received-Date: Mon, 26 Mar 2012 15:56:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.03.2012 13:34, Richard Purdie wrote:
> On Fri, 2012-03-23 at 21:17 +0100, Andreas Oberritter wrote:
>> On 12.03.2012 16:53, Richard Purdie wrote:
>>> On Mon, 2012-03-12 at 10:29 -0500, Mark Hatle wrote:
>>>> On 3/9/12 8:15 PM, Andreas Oberritter wrote:
>>>>> * Explicitly set umask to 022. Otherwise the build system's
>>>>>    umask leaks into the image.
>>>>
>>>> I'm surprised that do_package_ipk[umask] didn't work.  Perhaps its the way it's 
>>>> being invoked that is the issue.  (If bitbake doesn't run it, but something else 
>>>> does.. then the umask setting doesn't get used.)
>>>>
>>>> As for the change of the umask, the changes appear to be specific to the ipk 
>>>> case.  Is this the desired behavior, or could deb and rpm suffer from similar 
>>>> issues?  (I'm not familiar enough with opkg to know how it handles umask 
>>>> settings during package install/rootfs construction..)
>>>>
>>>> I believe that RPM sets a default umask when it goes through it's package 
>>>> installs/rootfs generation.  But does DEB?
>>>
>>> I'm also a bit worried about this patch. I'd like to understand why a
>>> task level umask doesn't work. That shouldn't even make any difference
>>> since the permissions/owners/users from install should be getting
>>> used...
>>
>> can you please give some advise on how to continue with this issue?
> 
> I understand half the problem now, the files with the issues are ones
> created during the package_ipk task. That addresses one of my big
> concerns.
> 
> The second thing I'd like to understand is why a task level umask
> doesn't resolve this. Looking at what you tried, this might be as simple
> as a typo:
> 
> do_package_ipk[umask] = "022"
> 
> when you really want:
> 
> do_package_write_ipk[umask] = "022"

Richard,

thank you, that did it. It wasn't a typo, but lack of understanding of 
the "magic" behind it, as I tried to apply the umask to the 
do_package_ipk function instead of the do_package_write_ipk *task*.

Please see below for an updated patch.

Regards,
Andreas

> If that works, lets set this for deb and rpm too so we're consistent and
> I'll merge that patch :)

From f9e4707d7a619e29530ac144ae1aba9d9e406884 Mon Sep 17 00:00:00 2001
From: Andreas Oberritter <obi@opendreambox.org>
Date: Sat, 10 Mar 2012 03:11:57 +0100
Subject: [PATCH] package_{deb,ipk,rpm}: apply umask to files generated in
 do_package_write_{deb,ipk,rpm}

* Explicitly set umask to 022. Otherwise the build system's
  umask may leak into the image.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/classes/package_deb.bbclass |    1 +
 meta/classes/package_ipk.bbclass |    1 +
 meta/classes/package_rpm.bbclass |    1 +
 3 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 1f7ec9c..9880258 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -421,6 +421,7 @@ python do_package_write_deb () {
 	bb.build.exec_func("do_package_deb", d)
 }
 do_package_write_deb[dirs] = "${PKGWRITEDIRDEB}"
+do_package_write_deb[umask] = "022"
 addtask package_write_deb before do_package_write after do_package
 
 
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 565ef93..e4a217b 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -453,6 +453,7 @@ python do_package_write_ipk () {
 	bb.build.exec_func("do_package_ipk", d)
 }
 do_package_write_ipk[dirs] = "${PKGWRITEDIRIPK}"
+do_package_write_ipk[umask] = "022"
 addtask package_write_ipk before do_package_write after do_package
 
 PACKAGEINDEXES += "package_update_index_ipk;"
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index e83fc55..daa9301 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -1056,6 +1056,7 @@ python do_package_write_rpm () {
 }
 
 do_package_write_rpm[dirs] = "${PKGWRITEDIRRPM}"
+do_package_write_rpm[umask] = "022"
 addtask package_write_rpm before do_package_write after do_package
 
 PACKAGEINDEXES += "package_update_index_rpm; createrepo ${DEPLOY_DIR_RPM};"
-- 
1.7.5.4



