Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DD96D6CD0E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 10:45:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9HAj1C4019398
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 17 Oct 2013 03:45:01 -0700 (PDT)
Received: from [128.224.162.145] (128.224.162.145) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Thu, 17 Oct 2013 03:45:01 -0700
Message-ID: <525FBFA9.6030708@windriver.com>
Date: Thu, 17 Oct 2013 18:44:57 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1382004192-12678-1-git-send-email-ming.liu@windriver.com>
	<1382004192-12678-2-git-send-email-ming.liu@windriver.com>
	<20131017103355.GB3930@jama>
In-Reply-To: <20131017103355.GB3930@jama>
X-Originating-IP: [128.224.162.145]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 2/2] screen: add pkg_postinst to register entry to /etc/shells
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
X-List-Received-Date: Thu, 17 Oct 2013 10:45:02 -0000
Content-Type: multipart/alternative;
	boundary="------------000609030203050209090201"

--------------000609030203050209090201
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/2013 06:33 PM, Martin Jansa wrote:
> On Thu, Oct 17, 2013 at 06:03:12PM +0800, Ming Liu wrote:
>> Signed-off-by: Ming Liu <ming.liu@windriver.com>
>> ---
>>   meta/recipes-extended/screen/screen_4.0.3.bb | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/meta/recipes-extended/screen/screen_4.0.3.bb b/meta/recipes-extended/screen/screen_4.0.3.bb
>> index 1a7eb20..81e418b 100644
>> --- a/meta/recipes-extended/screen/screen_4.0.3.bb
>> +++ b/meta/recipes-extended/screen/screen_4.0.3.bb
>> @@ -41,3 +41,8 @@ do_install_append () {
>>   		fi
>>   	done
>>   }
>> +
>> +pkg_postinst_${PN} () {
>> +	touch $D${sysconfdir}/shells
>> +	grep -q "${bindir}/screen" $D${sysconfdir}/shells || echo ${bindir}/screen >> $D${sysconfdir}/shells
>                    ^ the same, we don't want to match /usr/bin/screenie
> if it's there and "screen" isn't
Yes, you are correct, I am too less comprehensive.

>
> Is there patch to add this postinst to bash and busybox?
For bash, it already has it, as following:
------------------
pkg_postinst_${PN} () {
         touch $D${sysconfdir}/shells
         grep -q "bin/bash" $D${sysconfdir}/shells || echo /bin/bash >> 
$D${sysconfdir}/shells
         grep -q "bin/sh" $D${sysconfdir}/shells || echo /bin/sh >> 
$D${sysconfdir}/shells
}
-----------------

But as you pointed out, it needs to be more stringent too.

For busybox, I don't think it need this script for it provides the 
symbol link: /bin/sh.

//Ming Liu

>
>> +}
>> -- 
>> 1.8.3.3
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--------------000609030203050209090201
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 10/17/2013 06:33 PM, Martin Jansa
      wrote:<br>
    </div>
    <blockquote cite="mid:20131017103355.GB3930@jama" type="cite">
      <pre wrap="">On Thu, Oct 17, 2013 at 06:03:12PM +0800, Ming Liu wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">Signed-off-by: Ming Liu <a class="moz-txt-link-rfc2396E" href="mailto:ming.liu@windriver.com">&lt;ming.liu@windriver.com&gt;</a>
---
 meta/recipes-extended/screen/screen_4.0.3.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/screen/screen_4.0.3.bb b/meta/recipes-extended/screen/screen_4.0.3.bb
index 1a7eb20..81e418b 100644
--- a/meta/recipes-extended/screen/screen_4.0.3.bb
+++ b/meta/recipes-extended/screen/screen_4.0.3.bb
@@ -41,3 +41,8 @@ do_install_append () {
 		fi
 	done
 }
+
+pkg_postinst_${PN} () {
+	touch $D${sysconfdir}/shells
+	grep -q "${bindir}/screen" $D${sysconfdir}/shells || echo ${bindir}/screen &gt;&gt; $D${sysconfdir}/shells
</pre>
      </blockquote>
      <pre wrap="">                  ^ the same, we don't want to match /usr/bin/screenie
if it's there and "screen" isn't</pre>
    </blockquote>
    Yes, you are correct, I am
    <meta http-equiv="content-type" content="text/html;
      charset=ISO-8859-1">
    too less comprehensive.<br>
    <br>
    <blockquote cite="mid:20131017103355.GB3930@jama" type="cite">
      <pre wrap="">

Is there patch to add this postinst to bash and busybox?</pre>
    </blockquote>
    For bash, it already has it, as following:<br>
    ------------------<br>
    pkg_postinst_${PN} () {<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; touch $D${sysconfdir}/shells<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; grep -q "bin/bash" $D${sysconfdir}/shells || echo /bin/bash
    &gt;&gt; $D${sysconfdir}/shells<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; grep -q "bin/sh" $D${sysconfdir}/shells || echo /bin/sh
    &gt;&gt; $D${sysconfdir}/shells<br>
    }<br>
    -----------------<br>
    <br>
    But as you pointed out, it needs to be more stringent too.<br>
    <br>
    For busybox, I don't think it need this script for it provides the
    symbol link: /bin/sh.<br>
    <br>
    //Ming Liu<br>
    <br>
    <blockquote cite="mid:20131017103355.GB3930@jama" type="cite">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">+}
-- 
1.8.3.3

_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>
</pre>
      </blockquote>
      <pre wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------000609030203050209090201--
