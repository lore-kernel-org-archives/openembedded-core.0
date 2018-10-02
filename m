Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 94B4A79313
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Oct 2018 15:32:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w92FWC5e027187
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Oct 2018 08:32:23 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 2 Oct 2018 08:32:02 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1538199671.git.kai.kang@windriver.com>
	<5266d8bc086fe75047d2cc84d25a4a83b28811b5.1538199671.git.kai.kang@windriver.com>
	<d53eac33f13004eec2b52746d09ca77a3019ccaa.camel@linuxfoundation.org>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <ee33ddce-5bba-6102-79da-7466e5f2d667@windriver.com>
Date: Tue, 2 Oct 2018 23:29:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <d53eac33f13004eec2b52746d09ca77a3019ccaa.camel@linuxfoundation.org>
Subject: Re: [PATCH 05/10] nss: move create blank certificates to pkg_postinst
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
X-List-Received-Date: Tue, 02 Oct 2018 15:32:48 -0000
Content-Type: multipart/alternative;
	boundary="------------DD6E80E0F51B7AF9A5BDC57A"
Content-Language: en-US

--------------DD6E80E0F51B7AF9A5BDC57A
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2018年09月29日 20:44, Richard Purdie wrote:
> On Sat, 2018-09-29 at 13:43 +0800, kai.kang@windriver.com wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> There is a multilib install file conflict of nss:
>>> file /etc/pki/nssdb/key4.db conflicts between attempted installs of
>>> lib32-nss-3.38-r0.corei7_32 and nss-3.38-r0.corei7_64
>> Move the creation of blank certificates to pkg_postinst. And check if
>> certificates exist already, don't re-create them.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta/recipes-support/nss/nss_3.38.bb | 32 +++++++++++++++++---------
>> --
>>   1 file changed, 20 insertions(+), 12 deletions(-)
> This does raise a question - why aren't the generated files the same?
> Is there a determinism problem here? This sounds like the image would
> change with each build and couldn't be reproduced so we have a bigger
> problem?

It calls certutil to create blank certificates:

certutil -N -d sql:${D}${sysconfdir}/pki/nssdb/ -f ./empty_password

It should be current time related that create blank certificates in 
current directory, the key4.db files are different:

kkang@msp-lpggp1:~/buildarea/bar-build
$ touch empty
kkang@msp-lpggp1:~/buildarea/bar-build
$ ./tmp/sysroots-components/x86_64/nss-native/usr/bin/certutil -N -d 
sql:./ -f ./empty
password file contains no data
kkang@msp-lpggp1:~/buildarea/bar-build
$ md5sum *.db
1de1260b3f38349a8633d33acd4e4de7  cert9.db
*7fea1d4dbc99db3ba1b72e30428eb5dc  key4.db*
kkang@msp-lpggp1:~/buildarea/bar-build
$ rm *.db
kkang@msp-lpggp1:~/buildarea/bar-build
$ ./tmp/sysroots-components/x86_64/nss-native/usr/bin/certutil -N -d 
sql:./ -f ./empty
password file contains no data
kkang@msp-lpggp1:~/buildarea/bar-build
$ md5sum *.db
1de1260b3f38349a8633d33acd4e4de7  cert9.db
*9fbbae3e2d65d29f51e357a2dc4650a2  key4.db*


Regards,
Kai


>
> Cheers,
>
> Richard
>

-- 
Regards,
Neil | Kai Kang


--------------DD6E80E0F51B7AF9A5BDC57A
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2018年09月29日 20:44, Richard Purdie
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:d53eac33f13004eec2b52746d09ca77a3019ccaa.camel@linuxfoundation.org">
      <pre wrap="">On Sat, 2018-09-29 at 13:43 +0800, <a class="moz-txt-link-abbreviated" href="mailto:kai.kang@windriver.com">kai.kang@windriver.com</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">From: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>

There is a multilib install file conflict of nss:
</pre>
        <blockquote type="cite">
          <pre wrap="">file /etc/pki/nssdb/key4.db conflicts between attempted installs of
lib32-nss-3.38-r0.corei7_32 and nss-3.38-r0.corei7_64
</pre>
        </blockquote>
        <pre wrap="">
Move the creation of blank certificates to pkg_postinst. And check if
certificates exist already, don't re-create them.

Signed-off-by: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>
---
 meta/recipes-support/nss/nss_3.38.bb | 32 +++++++++++++++++---------
--
 1 file changed, 20 insertions(+), 12 deletions(-)
</pre>
      </blockquote>
      <pre wrap="">
This does raise a question - why aren't the generated files the same?
Is there a determinism problem here? This sounds like the image would
change with each build and couldn't be reproduced so we have a bigger
problem?</pre>
    </blockquote>
    <br>
    It calls certutil to create blank certificates: <br>
    <br>
    certutil -N -d sql:${D}${sysconfdir}<i class="moz-txt-slash"><span
        class="moz-txt-tag">/</span>pki/nssdb<span class="moz-txt-tag">/</span></i>
    -f ./empty_password<br>
    <br>
    It should be current time related that create blank certificates in
    current directory, the key4.db files are different:<br>
    <br>
    kkang@msp-lpggp1:~/buildarea/bar-build<br>
    $ touch empty<br>
    kkang@msp-lpggp1:~/buildarea/bar-build<br>
    $ ./tmp/sysroots-components/x86_64/nss-native/usr/bin/certutil -N -d
    sql:./ -f ./empty <br>
    password file contains no data<br>
    kkang@msp-lpggp1:~/buildarea/bar-build<br>
    $ md5sum *.db<br>
    1de1260b3f38349a8633d33acd4e4de7  cert9.db<br>
    *7fea1d4dbc99db3ba1b72e30428eb5dc  key4.db*<br>
    kkang@msp-lpggp1:~/buildarea/bar-build<br>
    $ rm *.db<br>
    kkang@msp-lpggp1:~/buildarea/bar-build<br>
    $ ./tmp/sysroots-components/x86_64/nss-native/usr/bin/certutil -N -d
    sql:./ -f ./empty <br>
    password file contains no data<br>
    kkang@msp-lpggp1:~/buildarea/bar-build<br>
    $ md5sum *.db<br>
    1de1260b3f38349a8633d33acd4e4de7  cert9.db<br>
    *9fbbae3e2d65d29f51e357a2dc4650a2  key4.db*<br>
    <br>
    <br>
    Regards,<br>
    Kai<br>
    <br>
    <br>
    <blockquote type="cite"
cite="mid:d53eac33f13004eec2b52746d09ca77a3019ccaa.camel@linuxfoundation.org">
      <pre wrap="">

Cheers,

Richard

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Regards,
Neil | Kai Kang</pre>
  </body>
</html>

--------------DD6E80E0F51B7AF9A5BDC57A--
