Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2D3926D989
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 02:29:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x0E2TpC1020567
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 13 Jan 2019 18:29:51 -0800 (PST)
Received: from [128.224.163.218] (128.224.163.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Sun, 13 Jan 2019 18:29:50 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <20190104024910.674-1-kai.kang@windriver.com>
	<69a099eb-d6ee-5464-ad35-a267895b2e58@windriver.com>
	<CAJTo0LbeKM_CFGsbq1-SJdaBpWGz10B_jy+8t4i97x0LeAeesg@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <7c19025b-0655-6539-35eb-b7071e5658ad@windriver.com>
Date: Mon, 14 Jan 2019 10:29:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbeKM_CFGsbq1-SJdaBpWGz10B_jy+8t4i97x0LeAeesg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic: update test case test_qemu
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
X-List-Received-Date: Mon, 14 Jan 2019 02:29:53 -0000
Content-Type: multipart/alternative;
	boundary="------------7916C5205A102C090FAD91D4"
Content-Language: en-US

--------------7916C5205A102C090FAD91D4
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2019/1/11 下午9:15, Burton, Ross wrote:
> I'm wondering what the point of checking the output of mount is.  If 
> we're just checking that the image booted then the grep is sufficient 
> right?


If just checking the wic image has been booted successfully, I think 
grep /boot is sufficient. V2 will be sent.

--Kai



>
> Ross
>
> On Fri, 11 Jan 2019 at 09:22, Kang Kai <Kai.Kang@windriver.com 
> <mailto:Kai.Kang@windriver.com>> wrote:
>
>     On 2019/1/4 上午10:49, kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com> wrote:
>     > From: Kai Kang <kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com>>
>     >
>     > It checks output of mount in wic test case test_qemu. But the
>     outputs are
>     > different between sysvinit and systemd. Add assertion for systemd.
>     >
>     > Signed-off-by: Kai Kang <kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com>>
>     > ---
>     >   meta/lib/oeqa/selftest/cases/wic.py | 5 ++++-
>     >   1 file changed, 4 insertions(+), 1 deletion(-)
>     >
>     > diff --git a/meta/lib/oeqa/selftest/cases/wic.py
>     b/meta/lib/oeqa/selftest/cases/wic.py
>     > index 36ee5e5a14..a6bc566166 100644
>     > --- a/meta/lib/oeqa/selftest/cases/wic.py
>     > +++ b/meta/lib/oeqa/selftest/cases/wic.py
>     > @@ -627,7 +627,10 @@ class Wic2(WicTestCase):
>     >           with runqemu('wic-image-minimal', ssh=False) as qemu:
>     >               cmd = "mount |grep '^/dev/' | cut -f1,3 -d ' ' | sort"
>     >               status, output = qemu.run_serial(cmd)
>     > -            self.assertEqual(output, '/dev/root /\r\n/dev/sda1
>     /boot\r\n/dev/sda3 /media\r\n/dev/sda4 /mnt')
>     > +            if 'sysvinit' in get_bb_var('DISTRO_FEATURES'):
>     > +                self.assertEqual(output, '/dev/root
>     /\r\n/dev/sda1 /boot\r\n/dev/sda3 /media\r\n/dev/sda4 /mnt')
>     > +            else:
>     > +                self.assertEqual(output, '/dev/sda1
>     /boot\r\n/dev/sda2 /\r\n/dev/sda3 /media\r\n/dev/sda4 /mnt')
>     >               cmd = "grep UUID= /etc/fstab"
>     >               status, output = qemu.run_serial(cmd)
>     >               self.assertEqual(1, status, 'Failed to run command
>     "%s": %s' % (cmd, output))
>
>
>     Ping
>
>     -- 
>     Kai Kang
>
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

-- 
Kai Kang


--------------7916C5205A102C090FAD91D4
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 2019/1/11 下午9:15, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0LbeKM_CFGsbq1-SJdaBpWGz10B_jy+8t4i97x0LeAeesg@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">I'm wondering what the point of checking the output
        of mount is.  If we're just checking that the image booted then
        the grep is sufficient right?</div>
    </blockquote>
    <p><br>
    </p>
    <p>If just checking the wic image has been booted successfully, I
      think grep /boot is sufficient. V2 will be sent.</p>
    <p>--Kai<br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CAJTo0LbeKM_CFGsbq1-SJdaBpWGz10B_jy+8t4i97x0LeAeesg@mail.gmail.com">
      <div dir="ltr">
        <div><br>
        </div>
        <div>Ross</div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr">On Fri, 11 Jan 2019 at 09:22, Kang Kai &lt;<a
            href="mailto:Kai.Kang@windriver.com" moz-do-not-send="true">Kai.Kang@windriver.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">On
          2019/1/4 上午10:49, <a href="mailto:kai.kang@windriver.com"
            target="_blank" moz-do-not-send="true">kai.kang@windriver.com</a>
          wrote:<br>
          &gt; From: Kai Kang &lt;<a
            href="mailto:kai.kang@windriver.com" target="_blank"
            moz-do-not-send="true">kai.kang@windriver.com</a>&gt;<br>
          &gt;<br>
          &gt; It checks output of mount in wic test case test_qemu. But
          the outputs are<br>
          &gt; different between sysvinit and systemd. Add assertion for
          systemd.<br>
          &gt;<br>
          &gt; Signed-off-by: Kai Kang &lt;<a
            href="mailto:kai.kang@windriver.com" target="_blank"
            moz-do-not-send="true">kai.kang@windriver.com</a>&gt;<br>
          &gt; ---<br>
          &gt;   meta/lib/oeqa/selftest/cases/wic.py | 5 ++++-<br>
          &gt;   1 file changed, 4 insertions(+), 1 deletion(-)<br>
          &gt;<br>
          &gt; diff --git a/meta/lib/oeqa/selftest/cases/wic.py
          b/meta/lib/oeqa/selftest/cases/wic.py<br>
          &gt; index 36ee5e5a14..a6bc566166 100644<br>
          &gt; --- a/meta/lib/oeqa/selftest/cases/wic.py<br>
          &gt; +++ b/meta/lib/oeqa/selftest/cases/wic.py<br>
          &gt; @@ -627,7 +627,10 @@ class Wic2(WicTestCase):<br>
          &gt;           with runqemu('wic-image-minimal', ssh=False) as
          qemu:<br>
          &gt;               cmd = "mount |grep '^/dev/' | cut -f1,3 -d
          ' ' | sort"<br>
          &gt;               status, output = qemu.run_serial(cmd)<br>
          &gt; -            self.assertEqual(output, '/dev/root
          /\r\n/dev/sda1 /boot\r\n/dev/sda3 /media\r\n/dev/sda4 /mnt')<br>
          &gt; +            if 'sysvinit' in
          get_bb_var('DISTRO_FEATURES'):<br>
          &gt; +                self.assertEqual(output, '/dev/root
          /\r\n/dev/sda1 /boot\r\n/dev/sda3 /media\r\n/dev/sda4 /mnt')<br>
          &gt; +            else:<br>
          &gt; +                self.assertEqual(output, '/dev/sda1
          /boot\r\n/dev/sda2 /\r\n/dev/sda3 /media\r\n/dev/sda4 /mnt')<br>
          &gt;               cmd = "grep UUID= /etc/fstab"<br>
          &gt;               status, output = qemu.run_serial(cmd)<br>
          &gt;               self.assertEqual(1, status, 'Failed to run
          command "%s": %s' % (cmd, output))<br>
          <br>
          <br>
          Ping<br>
          <br>
          -- <br>
          Kai Kang<br>
          <br>
          -- <br>
          _______________________________________________<br>
          Openembedded-core mailing list<br>
          <a href="mailto:Openembedded-core@lists.openembedded.org"
            target="_blank" moz-do-not-send="true">Openembedded-core@lists.openembedded.org</a><br>
          <a
            href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
            rel="noreferrer" target="_blank" moz-do-not-send="true">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
        </blockquote>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Kai Kang</pre>
  </body>
</html>

--------------7916C5205A102C090FAD91D4--
