Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5EAB66077D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 07:11:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r797B90B023857
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 9 Aug 2013 00:11:09 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Fri, 9 Aug 2013 00:11:07 -0700
Message-ID: <52049623.7020308@windriver.com>
Date: Fri, 9 Aug 2013 15:11:31 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <20130731055135.A7345504BD@opal> <20130808172507.GB3269@jama>
In-Reply-To: <20130808172507.GB3269@jama>
X-Originating-IP: [128.224.162.233]
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
X-List-Received-Date: Fri, 09 Aug 2013 07:11:08 -0000
Content-Type: multipart/alternative;
	boundary="------------080909080707000502060803"

--------------080909080707000502060803
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Martin,

I think this is the same problem we discussed before.
The thread is "busybox: fix the on-target upgrade problem".

The problem roots in opkg's update-alternatives.
At that time, I made a patch to fix this problem.
I didn't send it out because I then found some other problems with 
update-alternatives in OE/Yocto.
And I filed a bug to track these issues. I wanted to fix them all in one 
patchset.
(https://bugzilla.yoctoproject.org/show_bug.cgi?id=4836)

Best Regards,
Chen Qi

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
>
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
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--------------080909080707000502060803
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Hi Martin,<br>
      <br>
      I think this is the same problem we discussed before.<br>
      The thread is "busybox: fix the on-target upgrade problem".<br>
      <br>
      The problem roots in opkg's update-alternatives.
      <br>
      At that time, I made a patch to fix this problem.<br>
      I didn't send it out because I then found some other problems with
      update-alternatives in OE/Yocto.<br>
      And I filed a bug to track these issues. I wanted to fix them all
      in one patchset.<br>
      (<a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=4836">https://bugzilla.yoctoproject.org/show_bug.cgi?id=4836</a>)<br>
      <br>
      Best Regards,<br>
      Chen Qi<br>
      <br>
      On 08/09/2013 01:25 AM, Martin Jansa wrote:<br>
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
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------080909080707000502060803--
