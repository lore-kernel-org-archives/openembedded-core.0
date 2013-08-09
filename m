Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C3EC56077D;
	Fri,  9 Aug 2013 06:47:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r796lQve008354
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 8 Aug 2013 23:47:26 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 8 Aug 2013 23:47:26 -0700
Message-ID: <5204907A.5040301@windriver.com>
Date: Fri, 9 Aug 2013 14:47:22 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <20130731055135.A7345504BD@opal> <20130808172507.GB3269@jama>
In-Reply-To: <20130808172507.GB3269@jama>
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Hongxu Jia : util-linux: use u-a for su
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
X-List-Received-Date: Fri, 09 Aug 2013 06:47:28 -0000
Content-Type: multipart/alternative;
	boundary="------------090902020904090804060306"

--------------090902020904090804060306
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/09/2013 01:25 AM, Martin Jansa wrote:
> On Wed, Jul 31, 2013 at 05:51:35AM +0000, git@git.openembedded.org wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: 6190c69a9f78aeef951c39e4c8700e945bbec5f7
>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=6190c69a9f78aeef951c39e4c8700e945bbec5f7
>>
>> Author: Hongxu Jia <hongxu.jia@windriver.com>
>> Date:   Fri Jul 26 20:09:08 2013 +0800
>>
>> util-linux: use u-a for su
>>
>> Use alternatives mechanism to prevent confliction of attempted
>> installing su binary among busybox, shadow and util-linux.
>>
>> [YOCTO #4926]
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> Doesn't seem to work correctly:
>
> Configuring util-linux.
> update-alternatives: Linking //bin/dmesg to /bin/dmesg.util-linux
> update-alternatives: Linking //bin/kill to /bin/kill.procps
> update-alternatives: Linking //bin/more to /bin/more.util-linux
> update-alternatives: Linking //sbin/mkswap to /sbin/mkswap.util-linux
> update-alternatives: Linking //sbin/blockdev to /sbin/blockdev.util-linux
> update-alternatives: Linking //sbin/pivot_root to /sbin/pivot_root.util-linux
> update-alternatives: Linking //sbin/mkfs.minix to /sbin/mkfs.minix.util-linux
> update-alternatives: Linking //usr/bin/hexdump to /usr/bin/hexdump.util-linux
> update-alternatives: Linking //usr/bin/last to /usr/bin/last.util-linux
> update-alternatives: Linking //usr/bin/logger to /usr/bin/logger.util-linux
> update-alternatives: Linking //usr/bin/mesg to /usr/bin/mesg.util-linux
> update-alternatives: Linking //usr/bin/renice to /usr/bin/renice.util-linux
> update-alternatives: Linking //usr/bin/wall to /usr/bin/wall.util-linux
> update-alternatives: Linking //usr/bin/setsid to /usr/bin/setsid.util-linux
> update-alternatives: Linking //usr/bin/chrt to /usr/bin/chrt.util-linux
> update-alternatives: Linking //usr/bin/flock to /usr/bin/flock.util-linux
> update-alternatives: Linking //sbin/hwclock to /bin/busybox.nosuid
> update-alternatives: Linking //usr/bin/utmpdump to /usr/bin/utmpdump.util-linux
> update-alternatives: Linking //usr/bin/eject to /usr/bin/eject.util-linux
> update-alternatives: Linking //bin/getopt to /usr/bin/getopt
> update-alternatives: Error: cannot register alternative su to /usr/bin/su since it is already registered to /bin/su
>
> SHR root@gjama ~ $ cat /var/lib/opkg/alternatives/su
> /bin/su
> /bin/busybox.suid 50
Are you sure the following patch has been updated to your local branch?
http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=hongxu/fix-su&id=32eee3e731772da04ccb64b4da9ca9b413433674

busybox: move /bin/su to /usr/bin/su to match util-linux and shadow
This patch is used to fix this issue.

Maybe you should rebuild busybox and try again.

Thanks,
Hongxu

> should base_bindir be used for ALTERNATIVE_LINK_NAME and bindir for TARGET?
>
>> ---
>>
>>   meta/recipes-core/util-linux/util-linux.inc |    7 +++++++
>>   1 files changed, 7 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
>> index 3c8c246..961bcc5 100644
>> --- a/meta/recipes-core/util-linux/util-linux.inc
>> +++ b/meta/recipes-core/util-linux/util-linux.inc
>> @@ -215,3 +215,10 @@ ALTERNATIVE_LINK_NAME[reset] = "${bindir}/reset"
>>   ALTERNATIVE_TARGET[reset] = "${base_bindir}/reset"
>>   
>>   BBCLASSEXTEND = "native nativesdk"
>> +
>> +python do_package_prepend () {
>> +    if '--enable-su' in d.getVar('EXTRA_OECONF', True).split():
>> +        alt_name = "su"
>> +        d.setVarFlag('ALTERNATIVE_LINK_NAME', alt_name, '%s/%s' % (d.getVar('bindir', True), alt_name))
>> +        d.appendVar('ALTERNATIVE_%s' % (d.getVar('PN', True)), ' ' + alt_name)
>> +}
>>
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits


--------------090902020904090804060306
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 08/09/2013 01:25 AM, Martin Jansa
      wrote:<br>
    </div>
    <blockquote cite="mid:20130808172507.GB3269@jama" type="cite">
      <pre wrap="">On Wed, Jul 31, 2013 at 05:51:35AM +0000, <a class="moz-txt-link-abbreviated" href="mailto:git@git.openembedded.org">git@git.openembedded.org</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">Module: openembedded-core.git
Branch: master
Commit: 6190c69a9f78aeef951c39e4c8700e945bbec5f7
URL:    <a class="moz-txt-link-freetext" href="http://git.openembedded.org/?p=openembedded-core.git&amp;a=commit;h=6190c69a9f78aeef951c39e4c8700e945bbec5f7">http://git.openembedded.org/?p=openembedded-core.git&amp;a=commit;h=6190c69a9f78aeef951c39e4c8700e945bbec5f7</a>

Author: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
Date:   Fri Jul 26 20:09:08 2013 +0800

util-linux: use u-a for su

Use alternatives mechanism to prevent confliction of attempted
installing su binary among busybox, shadow and util-linux.

[YOCTO #4926]

Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
Signed-off-by: Saul Wold <a class="moz-txt-link-rfc2396E" href="mailto:sgw@linux.intel.com">&lt;sgw@linux.intel.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="">
Doesn't seem to work correctly:

Configuring util-linux.
update-alternatives: Linking //bin/dmesg to /bin/dmesg.util-linux
update-alternatives: Linking //bin/kill to /bin/kill.procps
update-alternatives: Linking //bin/more to /bin/more.util-linux
update-alternatives: Linking //sbin/mkswap to /sbin/mkswap.util-linux
update-alternatives: Linking //sbin/blockdev to /sbin/blockdev.util-linux
update-alternatives: Linking //sbin/pivot_root to /sbin/pivot_root.util-linux
update-alternatives: Linking //sbin/mkfs.minix to /sbin/mkfs.minix.util-linux
update-alternatives: Linking //usr/bin/hexdump to /usr/bin/hexdump.util-linux
update-alternatives: Linking //usr/bin/last to /usr/bin/last.util-linux
update-alternatives: Linking //usr/bin/logger to /usr/bin/logger.util-linux
update-alternatives: Linking //usr/bin/mesg to /usr/bin/mesg.util-linux
update-alternatives: Linking //usr/bin/renice to /usr/bin/renice.util-linux
update-alternatives: Linking //usr/bin/wall to /usr/bin/wall.util-linux
update-alternatives: Linking //usr/bin/setsid to /usr/bin/setsid.util-linux
update-alternatives: Linking //usr/bin/chrt to /usr/bin/chrt.util-linux
update-alternatives: Linking //usr/bin/flock to /usr/bin/flock.util-linux
update-alternatives: Linking //sbin/hwclock to /bin/busybox.nosuid
update-alternatives: Linking //usr/bin/utmpdump to /usr/bin/utmpdump.util-linux
update-alternatives: Linking //usr/bin/eject to /usr/bin/eject.util-linux
update-alternatives: Linking //bin/getopt to /usr/bin/getopt
update-alternatives: Error: cannot register alternative su to /usr/bin/su since it is already registered to /bin/su

SHR root@gjama ~ $ cat /var/lib/opkg/alternatives/su
/bin/su
/bin/busybox.suid 50
</pre>
    </blockquote>
    <meta http-equiv="content-type" content="text/html;
      charset=ISO-8859-1">
    Are you sure the following patch has been updated to your local
    branch?<br>
    <a
href="http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=hongxu/fix-su&amp;id=32eee3e731772da04ccb64b4da9ca9b413433674">http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=hongxu/fix-su&amp;id=32eee3e731772da04ccb64b4da9ca9b413433674</a><br>
    <br>
    busybox: move /bin/su to /usr/bin/su to match util-linux and shadow<br>
    This patch is used to fix this issue.<br>
    <br>
    Maybe you should rebuild busybox and try again.<br>
    <br>
    Thanks,<br>
    Hongxu<br>
    <br>
    <blockquote cite="mid:20130808172507.GB3269@jama" type="cite">
      <pre wrap="">
should base_bindir be used for ALTERNATIVE_LINK_NAME and bindir for TARGET?

</pre>
      <blockquote type="cite">
        <pre wrap="">
---

 meta/recipes-core/util-linux/util-linux.inc |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 3c8c246..961bcc5 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -215,3 +215,10 @@ ALTERNATIVE_LINK_NAME[reset] = "${bindir}/reset"
 ALTERNATIVE_TARGET[reset] = "${base_bindir}/reset"
 
 BBCLASSEXTEND = "native nativesdk"
+
+python do_package_prepend () {
+    if '--enable-su' in d.getVar('EXTRA_OECONF', True).split():
+        alt_name = "su"
+        d.setVarFlag('ALTERNATIVE_LINK_NAME', alt_name, '%s/%s' % (d.getVar('bindir', True), alt_name))
+        d.appendVar('ALTERNATIVE_%s' % (d.getVar('PN', True)), ' ' + alt_name)
+}

_______________________________________________
Openembedded-commits mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-commits@lists.openembedded.org">Openembedded-commits@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.openembedded.org/mailman/listinfo/openembedded-commits">http://lists.openembedded.org/mailman/listinfo/openembedded-commits</a>
</pre>
      </blockquote>
      <pre wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------090902020904090804060306--
