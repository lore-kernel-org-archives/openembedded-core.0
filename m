Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1ED396057B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 05:40:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u1H5eSxj016260
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Feb 2016 21:40:29 -0800 (PST)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 16 Feb 2016 21:40:28 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1455606710.git.kai.kang@windriver.com>
	<edb161a868336c0688a6e03343ee7920b34222f5.1455606710.git.kai.kang@windriver.com>
	<CAJTo0LYOpP40zsTFKahoMzU1caXH+=qTUwgAAy1aV--pK_-E_g@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <56C407CB.4060100@windriver.com>
Date: Wed, 17 Feb 2016 13:40:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYOpP40zsTFKahoMzU1caXH+=qTUwgAAy1aV--pK_-E_g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] useradd_base.bbclass: fix simultaneous with flock
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
X-List-Received-Date: Wed, 17 Feb 2016 05:40:29 -0000
Content-Type: multipart/alternative;
	boundary="------------090904020105080700040102"

--------------090904020105080700040102
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2016年02月16日 20:09, Burton, Ross wrote:
>
> On 16 February 2016 at 07:14, <kai.kang@windriver.com 
> <mailto:kai.kang@windriver.com>> wrote:
>
>     +FLOCK_FILE=$SYSROOT/etc
>
>
> useradd_base is also used by extrausers.bbclass, so it would be best 
> if useradd_base decided where to use as a lock ($rootdir/${sysconfdir} 
> sounds sensible) instead of expecting that the caller sets FLOCK_FILE 
> and mysteriously failing if it wasn't set.

OK. Sounds good.

>
> Also if we're locking and waiting properly instead of using timeouts 
> and loops, can we remove the "does it exist?" check before the 
> operation (eg groupadd -f will exit 0 if the group exists) and after 
> (with proper locking that shouldn't be happening).

I prefer to keep such check. There is more than one case that causes 
operation error such as pass wrong parameters. The messages are helpful 
for developers.

Thanks,
Kai

>
> Ross


-- 
Regards,
Neil | Kai Kang


--------------090904020105080700040102
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2016年02月16日 20:09, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LYOpP40zsTFKahoMzU1caXH+=qTUwgAAy1aV--pK_-E_g@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 16 February 2016 at 07:14, <span
              dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:kai.kang@windriver.com" target="_blank">kai.kang@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":4lc" class="a3s" style="overflow:hidden">+FLOCK_FILE=$SYSROOT/etc<br>
              </div>
            </blockquote>
          </div>
          <br>
          useradd_base is also used by extrausers.bbclass, so it would
          be best if useradd_base decided where to use as a lock
          ($rootdir/${sysconfdir} sounds sensible) instead of expecting
          that the caller sets FLOCK_FILE and mysteriously failing if it
          wasn't set.</div>
      </div>
    </blockquote>
    <br>
    OK. Sounds good.<br>
    <br>
    <blockquote
cite="mid:CAJTo0LYOpP40zsTFKahoMzU1caXH+=qTUwgAAy1aV--pK_-E_g@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Also if we're locking and waiting
          properly instead of using timeouts and loops, can we remove
          the "does it exist?" check before the operation (eg groupadd
          -f will exit 0 if the group exists) and after (with proper
          locking that shouldn't be happening).</div>
      </div>
    </blockquote>
    <br>
    I prefer to keep such check. There is more than one case that causes
    operation error such as pass wrong parameters. The messages are 
    helpful for developers.<br>
    <br>
    Thanks,<br>
    Kai<br>
    <br>
    <blockquote
cite="mid:CAJTo0LYOpP40zsTFKahoMzU1caXH+=qTUwgAAy1aV--pK_-E_g@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
    <br>
    <pre class="moz-signature" cols="72">-- 
Regards,
Neil | Kai Kang</pre>
  </body>
</html>

--------------090904020105080700040102--
