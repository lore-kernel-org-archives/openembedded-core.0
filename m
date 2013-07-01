Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4293661FB9;
	Mon,  1 Jul 2013 12:33:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r61CXqZF015889
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Jul 2013 05:33:52 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Mon, 1 Jul 2013 05:33:51 -0700
Message-ID: <51D17747.6050903@windriver.com>
Date: Mon, 1 Jul 2013 20:34:15 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <20130625163758.7F04650176@opal> <20130628115633.GL3261@jama>
	<51D0E5EC.3050903@windriver.com>
	<CA+chaQcMRE9HZ_pv4YLKEjvYfa2HBFTYL+Tvg6CAWSWnULtRMQ@mail.gmail.com>
In-Reply-To: <CA+chaQcMRE9HZ_pv4YLKEjvYfa2HBFTYL+Tvg6CAWSWnULtRMQ@mail.gmail.com>
X-Originating-IP: [128.224.162.233]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Chen Qi : busybox: add the ability to split the busybox binary
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
X-List-Received-Date: Mon, 01 Jul 2013 12:33:54 -0000
Content-Type: multipart/alternative;
	boundary="------------060405060105040106080004"

--------------060405060105040106080004
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/01/2013 03:33 PM, Martin Jansa wrote:
> Hi Chen,
>
> 1) install image created before this change on target device (which 
> doesn't include coreutils, wget and is depending on usable busybox)
> 2) build feeds which include this change
> 3) run  "opkg update && opkg upgrade" on target device (or equivalent 
> in your favorite package manager)
> 4) you'll get unusable (and probably unbootable) system at this point, 
> because /bin/busybox binary from old busybox version was already 
> removed, but u-a symlinks to new /bin/busybox.(no)suid weren't created 
> because "sed" used in u-a doesn't work anymore.
>
> As work around I've used
> ln -s /bin/busybox.nosuid /bin/busybox
> to make old u-a links happy and able to finish postinst in new busybox 
> version.
>
> FWIW: having /bin/busybox -> busybox.nosuid sounds like good idea to 
> have "default" busybox in path for people who're running it directly.
>
> Regards,
>
Hi Martin,

I forgot the on device upgrade issue when I made the patchset.
Thank you for pointing it out.

I did some tests. The on device upgrade did broke with opkg as the 
package manager. RPM does not have this problem.

I'll make a follow-up patch to fix this problem tomorrow.

Thanks a lot,
Chen Qi




--------------060405060105040106080004
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 07/01/2013 03:33 PM, Martin Jansa
      wrote:<br>
    </div>
    <blockquote
cite="mid:CA+chaQcMRE9HZ_pv4YLKEjvYfa2HBFTYL+Tvg6CAWSWnULtRMQ@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">Hi Chen,
        <div><br>
        </div>
        <div>1) install image created before this change on target
          device (which doesn't include coreutils, wget and is depending
          on usable busybox)</div>
        <div>2) build feeds which include this change</div>
        <div>3) run  "opkg update &amp;&amp; opkg upgrade" on target
          device (or equivalent in your favorite package manager)</div>
        <div>4) you'll get unusable (and probably unbootable) system at
          this point, because /bin/busybox binary from old busybox
          version was already removed, but u-a symlinks to new
          /bin/busybox.(no)suid weren't created because "sed" used in
          u-a doesn't work anymore.</div>
        <div><br>
        </div>
        <div>As work around I've used</div>
        <div>ln -s /bin/busybox.nosuid /bin/busybox</div>
        <div>to make old u-a links happy and able to finish postinst in
          new busybox version.</div>
        <div><br>
        </div>
        <div>FWIW: having /bin/busybox -&gt; busybox.nosuid sounds like
          good idea to have "default" busybox in path for people who're
          running it directly.</div>
        <div><br>
        </div>
        <div>Regards,</div>
      </div>
      <div class="gmail_extra"><br>
      </div>
    </blockquote>
    Hi Martin,<br>
    <br>
    I forgot the on device upgrade issue when I made the patchset. <br>
    Thank you for pointing it out.<br>
    <br>
    I did some tests. The on device upgrade did broke with opkg as the
    package manager. RPM does not have this problem.<br>
    <br>
    I'll make a follow-up patch to fix this problem tomorrow.<br>
    <br>
    Thanks a lot,<br>
    Chen Qi<br>
    <br>
    <br>
    <br>
  </body>
</html>

--------------060405060105040106080004--
