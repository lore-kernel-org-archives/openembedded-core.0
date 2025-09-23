Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 650C6CAC5AE
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 15:42:21 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.223.1758640329916404635
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 08:12:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bIgkyhou;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: dani.barra25@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b555ab7fabaso1380715a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 08:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758640329; x=1759245129; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4acibxD/ebjlZb6BJmeT7Gao7mWFYgZSvB+c/unufxU=;
        b=bIgkyhouV2viq33H0g/bNXR1/B9m/ylxZ81zZcrYdAiFTF06l8IRnYCDzB7kOLJh3k
         dL96v+AcMXguUf6JRR16gt8xyH8HNTp2CWcA4jzA94basy4v6fszLntLcThAc7MtsaiR
         OVin/YSmK83dufht2sEj4LdY/ljM0d2HEAdU9IQAi1Ex1eBRxOl4tZHqQv0uzkIgeg7G
         4cGqrH17fAuX1XsXK3Ya0v9P7PvYVdB/nP61e+fWlITd7D+yagYuN0FIQWvuH2z2sg/S
         ZIwRpfg6xs3VjX5fDeupxos+a4j1QdYJBmsYM/BgqayU0bPFRJwUX89oEGW3USon6SZa
         l+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758640329; x=1759245129;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4acibxD/ebjlZb6BJmeT7Gao7mWFYgZSvB+c/unufxU=;
        b=enJYZ24V8Zuduj1quGbRIXcguG86s2g+hBciaACWuZ4IIyvEXjyOkJTy4YgRXBamly
         32hwQmdITMgAF2Q3MnXsVgdHJyodYW12Aj7rNnEIb0KcMYBTHdu+FmWHmAi6k9NZVRHt
         pcMaLifHutzu5WwUVscIyWNjeZUQr67qKo9ZYC1vsHG/2wspYS3eTWx94klDE7agO1UR
         TNbL3kjufEU4Rs5F1wQ0QPcIIwjWbmeFpTp+ZihEwixG16J+o7GhsE/DmX7AqzH5a0Xw
         HQraVSihVqV3UdV4i7e6jcCeB9PjWnGUA6ECcyKstCj6ShsvDBKrZk4svT4vVA35KH5o
         C+hg==
X-Forwarded-Encrypted: i=1; AJvYcCXjnmKyR/f7JVqpz111oOmhLkMoCm9bS6RB0J5YWOfDnFb31XlG9SiE9kp0skvx+m1YfWeplRvPX+qXNQh/9zD91Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxRliBGUNXnHsKfrnKa6i9T5zF5xtKBwI++nUE3qvGcMf2JYSaR
	fnLXm3L8+J69OcJJYD8gzTiTAhSXTJ+a6LH0uYsnamVfUkHPaX6bejQlkduzpAamHC2buZ+kcNJ
	vM5rOoseSma//QJ+9SbJpMMHPv1aE93rNhTI54Fs=
X-Gm-Gg: ASbGncvPv9AM6fpST3mc7aJiDCMJ1WmSIAMSwFmYhfSkocn5C9mhvU8IBe2eC78xcT7
	i8u96RV4w5KCpQ7QiOOoR2JULbF6eCvB9OUwRdvnjxij4u9GwvtLXL41hvOPKpVd5jC/H0/L8hC
	yVlzcWjYe+fLNAUL0TIZLu07ZRbddn5hUKYjUWZqiZX3G6cagaJfNwWZ7F1NELCCjogkXxmOlC2
	ZQTGQhNtYqQB4PlUCQ=
X-Google-Smtp-Source: AGHT+IHBM7co13K2GQXq+UceqJY+3qlp3NXBrMbVhQGFzCi7+VF1ZbvOOcCoMnheNHZe1fw9rwBswpeaQXuhWgvJclY=
X-Received: by 2002:a05:6122:178d:b0:53c:6d68:1ccf with SMTP id
 71dfb90a1353d-54bcafa6629mr913867e0c.13.1758639917381; Tue, 23 Sep 2025
 08:05:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250902190555.7929-1-dani.barra25@gmail.com> <DCK51OC59LCA.XXERUU1OP7Y@bootlin.com>
 <16907d6c-a28d-4369-95fd-199fcccba105@windriver.com> <CA+-=zY2PzZ3RqtzLbFzd6TxSdBVft2KrSvzKQqP2oxZZUMnWhg@mail.gmail.com>
In-Reply-To: <CA+-=zY2PzZ3RqtzLbFzd6TxSdBVft2KrSvzKQqP2oxZZUMnWhg@mail.gmail.com>
From: Daniel Andrade <dani.barra25@gmail.com>
Date: Tue, 23 Sep 2025 16:05:06 +0100
X-Gm-Features: AS18NWB8yQCpfTlfwQ4WThA9xyc8nJQCUb8FW629kaEIMvH2kBYeW3GnyD_mO2Q
Message-ID: <CA+-=zY09Um_hG1knpWFBRHx-mTBgNUN3vH9WA0nhiY7ub-PKvw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/1] wic: updated fstab does not preserve metadata of the original file
To: Randy MacLeod <randy.macleod@windriver.com>, openembedded-core@lists.openembedded.org, 
	mathieu.dubois-briand@bootlin.com
Cc: hongxu.jia@windriver.com, trevor.woerner@linaro.org
Content-Type: multipart/alternative; boundary="00000000000090417e063f794306"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 15:42:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223899

--00000000000090417e063f794306
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Good Afternoon,

I have been trying to figure it out and something seems off.
The specific test you refer to may be hiding a problem or maybe I have my
testbench compromised and I would like your help to test.
The test `test_no_fstab_update ` verifies if the fstab was updated or not
because on the wks file used to do it there is a --no-fstab-update. The
thing is, I think this test is passing because what is forcing it to not
update is a constraint that I removed previously on the patch (the one that
checks if the system is ext* or msdos) and not because the flag is
triggering its intended functionality.
The crosscheck I did was modifying the fstype from ext4 to squashfs and
indeed the test failed.
Can someone also verify this?

Daniel

Daniel Andrade <dani.barra25@gmail.com> escreveu (s=C3=A1bado, 13/09/2025 =
=C3=A0(s)
11:02):

> Hello guys, sorry for the delay.
> I have been busy, but I hope to provide you with a fix in the next few
> days.
>
> Sorry about that,
> Daniel
>
> Randy MacLeod <randy.macleod@windriver.com> escreveu (quinta, 11/09/2025
> =C3=A0(s) 17:56):
>
>> On 2025-09-04 11:58 a.m., Mathieu Dubois-Briand via
>> lists.openembedded.org wrote:
>>
>> On Tue Sep 2, 2025 at 9:05 PM CEST, dani.barra25 via lists.openembedded.=
org wrote:
>>
>> From: Daniel Andrade <dani.barra25@gmail.com> <dani.barra25@gmail.com>
>>
>> Using `install` in the rootfs plugin forces fstab to be replaced entirel=
y, meaning that even its Inodes will change, leading xattrs and SELinux con=
text stored by pseudo not to be applied.
>> The fix just uses `cp` without preserving attributes from the temporary =
fstab since none of them are needed, just the content.
>> Same thing happens with the predefined mechanisms for ext4 and msdos. Us=
ing debugfs there is no way to replace contents while maintaining metadata,=
 so the approach taken on the path was to remove the different fstab logic =
for those fstypes and also use the same modified cp command. Reviewing the =
builds I did it seems to work for all of the fstypes.
>>
>> Another problem is that the timestamp applied to fstab is not the same a=
s every other file. It seems like the `SOURCE_DATE_EPOCH` variable goes to =
the fallback timestamp (`SOURCE_DATE_EPOCH_FALLBACK`).
>> Since you are using that variable everywhere, it is not the same value a=
s ` REPRODUCIBLE_TIMESTAMP_ROOTFS` under `poky/meta/conf/bitbake.conf` that=
 is applied in every other file.
>>
>> Daniel Andrade (1):
>>   wic: Content of the temporary updated fstab should be copied into the
>>     original not replacing it entirely.
>>
>>  meta/conf/bitbake.conf                   |  4 +++-
>>  scripts/lib/wic/partition.py             | 15 +--------------
>>  scripts/lib/wic/plugins/source/rootfs.py |  4 ++--
>>  3 files changed, 6 insertions(+), 17 deletions(-)
>>
>> Hi Daniel,
>>
>> Thanks for your patch.
>>
>> It looks like it is breaking a test:
>>
>> 2025-09-04 15:28:11,112 - oe-selftest - INFO - wic.Wic.test_no_fstab_upd=
ate (subunit.RemotedTestCase)
>> 2025-09-04 15:28:11,113 - oe-selftest - INFO -  ... FAIL
>> ...
>> 2025-09-04 15:28:11,114 - oe-selftest - INFO - testtools.testresult.real=
._StringException: Traceback (most recent call last):
>>   File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/o=
eqa/selftest/cases/wic.py", line 859, in test_no_fstab_update
>>     self.assertEqual(bf_fstab_md5sum, part_fstab_md5sum[1])
>>   File "/usr/lib/python3.12/unittest/case.py", line 885, in assertEqual
>>     assertion_func(first, second, msg=3Dmsg)
>>   File "/usr/lib/python3.12/unittest/case.py", line 1251, in assertMulti=
LineEqual
>>     self.fail(self._formatMessage(msg, standardMsg))
>>   File "/usr/lib/python3.12/unittest/case.py", line 715, in fail
>>     raise self.failureException(msg)
>> AssertionError: 'af3c087d6c9131735c8d1f270a226892' !=3D '9edb8255abd217f=
db20e118833afb856'
>> - af3c087d6c9131735c8d1f270a226892
>> + 9edb8255abd217fdb20e118833afb856
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2412h=
ttps://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2268
>>
>> Can you fix it please?
>>
>> Ping?
>>
>> I think this is being tracked by:
>>
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15947
>>
>> "WIC does not preserve metadata when updating fstab"
>>
>> Btw, we were just following the "Need Info" process during the bug revie=
w
>> meeting
>> so that's why I'm sending this email.
>>
>> ../Randy
>>
>> Thanks,
>> Mathieu
>>
>>
>>
>>=20
>>
>>
>>
>> --
>> # Randy MacLeod
>> # Wind River Linux
>>
>>

--00000000000090417e063f794306
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Good Afternoon,<div><br><div>I have been trying to figure =
it out and something seems off.=C2=A0</div><div>The specific test you refer=
 to may be hiding a problem or maybe I have my testbench compromised and I =
would like your help to test.</div><div>The test `test_no_fstab_update ` ve=
rifies if the fstab was updated or not because on the wks file used to do i=
t there is a --no-fstab-update. The thing is, I think this test is passing =
because what is forcing it to not update is a constraint that I removed pre=
viously on the patch (the one that checks if the system is ext* or msdos) a=
nd not because the flag is triggering its intended functionality.=C2=A0</di=
v><div>The crosscheck I did was modifying the fstype from ext4 to squashfs =
and indeed=C2=A0the test failed.</div><div>Can someone also verify this?</d=
iv><div><br></div><div>Daniel</div></div></div><br><div class=3D"gmail_quot=
e gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Daniel Andra=
de &lt;<a href=3D"mailto:dani.barra25@gmail.com">dani.barra25@gmail.com</a>=
&gt; escreveu (s=C3=A1bado, 13/09/2025 =C3=A0(s) 11:02):<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hello guys, sorry=
 for the delay.=C2=A0<div>I have been busy, but I hope to provide you with =
a fix in the next few days.</div><div><br><div>Sorry about that,</div><div>=
Daniel</div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">Randy MacLeod &lt;<a href=3D"mailto:randy.macleod@windriv=
er.com" target=3D"_blank">randy.macleod@windriver.com</a>&gt; escreveu (qui=
nta, 11/09/2025 =C3=A0(s) 17:56):<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><u></u>

 =20
  <div>
    <div>On 2025-09-04 11:58 a.m., Mathieu
      Dubois-Briand via <a href=3D"http://lists.openembedded.org" target=3D=
"_blank">lists.openembedded.org</a> wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>On Tue Sep 2, 2025 at 9:05 PM CEST, dani.barra25 via <a href=3D"=
http://lists.openembedded.org" target=3D"_blank">lists.openembedded.org</a>=
 wrote:
</pre>
      <blockquote type=3D"cite">
        <pre>From: Daniel Andrade <a href=3D"mailto:dani.barra25@gmail.com"=
 target=3D"_blank">&lt;dani.barra25@gmail.com&gt;</a>

Using `install` in the rootfs plugin forces fstab to be replaced entirely, =
meaning that even its Inodes will change, leading xattrs and SELinux contex=
t stored by pseudo not to be applied.
The fix just uses `cp` without preserving attributes from the temporary fst=
ab since none of them are needed, just the content.
Same thing happens with the predefined mechanisms for ext4 and msdos. Using=
 debugfs there is no way to replace contents while maintaining metadata, so=
 the approach taken on the path was to remove the different fstab logic for=
 those fstypes and also use the same modified cp command. Reviewing the bui=
lds I did it seems to work for all of the fstypes.

Another problem is that the timestamp applied to fstab is not the same as e=
very other file. It seems like the `SOURCE_DATE_EPOCH` variable goes to the=
 fallback timestamp (`SOURCE_DATE_EPOCH_FALLBACK`).
Since you are using that variable everywhere, it is not the same value as `=
 REPRODUCIBLE_TIMESTAMP_ROOTFS` under `poky/meta/conf/bitbake.conf` that is=
 applied in every other file.

Daniel Andrade (1):
  wic: Content of the temporary updated fstab should be copied into the
    original not replacing it entirely.

 meta/conf/bitbake.conf                   |  4 +++-
 scripts/lib/wic/partition.py             | 15 +--------------
 scripts/lib/wic/plugins/source/rootfs.py |  4 ++--
 3 files changed, 6 insertions(+), 17 deletions(-)
</pre>
      </blockquote>
      <pre>Hi Daniel,

Thanks for your patch.

It looks like it is breaking a test:

2025-09-04 15:28:11,112 - oe-selftest - INFO - wic.Wic.test_no_fstab_update=
 (subunit.RemotedTestCase)
2025-09-04 15:28:11,113 - oe-selftest - INFO -  ... FAIL
...
2025-09-04 15:28:11,114 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File &quot;/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib=
/oeqa/selftest/cases/wic.py&quot;, line 859, in test_no_fstab_update
    self.assertEqual(bf_fstab_md5sum, part_fstab_md5sum[1])
  File &quot;/usr/lib/python3.12/unittest/case.py&quot;, line 885, in asser=
tEqual
    assertion_func(first, second, msg=3Dmsg)
  File &quot;/usr/lib/python3.12/unittest/case.py&quot;, line 1251, in asse=
rtMultiLineEqual
    self.fail(self._formatMessage(msg, standardMsg))
  File &quot;/usr/lib/python3.12/unittest/case.py&quot;, line 715, in fail
    raise self.failureException(msg)
AssertionError: &#39;af3c087d6c9131735c8d1f270a226892&#39; !=3D &#39;9edb82=
55abd217fdb20e118833afb856&#39;
- af3c087d6c9131735c8d1f270a226892
+ 9edb8255abd217fdb20e118833afb856

<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/buil=
ds/2412" target=3D"_blank">https://autobuilder.yoctoproject.org/valkyrie/#/=
builders/23/builds/2412</a>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/buil=
ds/2268" target=3D"_blank">https://autobuilder.yoctoproject.org/valkyrie/#/=
builders/35/builds/2268</a>

Can you fix it please?</pre>
    </blockquote>
    Ping?<br>
    <br>
    I think this is being tracked by:<br>
    <br>
    <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15947" t=
arget=3D"_blank">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15947<=
/a><br>
    <p><span id=3D"m_-6531217272267671509m_3677165041292214476summary_conta=
iner"><span id=3D"m_-6531217272267671509m_3677165041292214476short_desc_non=
edit_display">&quot;WIC does not preserve
          metadata when updating fstab&quot;</span></span></p>
    <p><span id=3D"m_-6531217272267671509m_3677165041292214476summary_conta=
iner"><span id=3D"m_-6531217272267671509m_3677165041292214476short_desc_non=
edit_display">Btw, we were just following
          the &quot;Need Info&quot; process during the bug review meeting<b=
r>
          so that&#39;s why I&#39;m sending this email.</span></span></p>
    <p><span id=3D"m_-6531217272267671509m_3677165041292214476summary_conta=
iner"><span id=3D"m_-6531217272267671509m_3677165041292214476short_desc_non=
edit_display">../Randy<br>
        </span></span></p>
    <br>
    <blockquote type=3D"cite">
      <pre>Thanks,
Mathieu

</pre>
      <br>
      <fieldset></fieldset>
      <pre>

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </div>

</blockquote></div>
</blockquote></div>

--00000000000090417e063f794306--

