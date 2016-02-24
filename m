Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B1AB2771EA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 08:51:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u1O8pFtp023385
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 24 Feb 2016 00:51:15 -0800 (PST)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 24 Feb 2016 00:51:14 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1456195451.git.kai.kang@windriver.com>
	<72d89d471771ecffc8eecc923581d3dcdcfdfa5e.1456195451.git.kai.kang@windriver.com>
	<CAJTo0LZStmCCA_ibNnxWO66CR+G3k51+bYVX2PrujJ2XD6mk2w@mail.gmail.com>
	<CAJTo0LbCLQDSEHi+MHz-+=RoHmkvFinEPTZWEdA0GzWQOp03Zw@mail.gmail.com>
	<CAJTo0Lbs50h0=46rp2ZV6cv=OgcyBCpfPJh6nvhEFB8HpMQzsA@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <56CD6F00.3060402@windriver.com>
Date: Wed, 24 Feb 2016 16:51:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lbs50h0=46rp2ZV6cv=OgcyBCpfPJh6nvhEFB8HpMQzsA@mail.gmail.com>
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
X-List-Received-Date: Wed, 24 Feb 2016 08:51:23 -0000
Content-Type: multipart/alternative;
	boundary="------------040603000701030908010108"

--------------040603000701030908010108
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2016年02月24日 01:10, Burton, Ross wrote:
>
> On 23 February 2016 at 17:01, Burton, Ross <ross.burton@intel.com 
> <mailto:ross.burton@intel.com>> wrote:
>
>     The *amazing* BB_VERBOSE_LOGS option (set to 1 in local.conf to
>     get all shell scripts to do set -x) tells me this is due to
>     missing quotes around the opts assignment:
>
>
> Why do some of the opts assignments just do opts=$2, and others do a sed?

In the previous version, there are:

local opts="$2"
...

opts=`echo $opts | sed s/\'/\"/g`

And I want to refactor them but lost the double quotes.

Only do sed operations for useradd and groupadd that they may be passed in "opts" with space but others didn't.

I'll restore to previous version.

Sorry for inconvenience that I built pass on Ubuntu 14.04 so didn't find 
this error.

--Kai

>
> Ross


-- 
Regards,
Neil | Kai Kang


--------------040603000701030908010108
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2016年02月24日 01:10, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0Lbs50h0=46rp2ZV6cv=OgcyBCpfPJh6nvhEFB8HpMQzsA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 23 February 2016 at 17:01, Burton,
            Ross <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:ross.burton@intel.com" target="_blank">ross.burton@intel.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div class="gmail_extra">The *amazing* BB_VERBOSE_LOGS
                option (set to 1 in local.conf to get all shell scripts
                to do set -x) tells me this is due to missing quotes
                around the opts assignment:</div>
            </blockquote>
          </div>
          <br>
          Why do some of the opts assignments just do opts=$2, and
          others do a sed?</div>
      </div>
    </blockquote>
    <br>
    In the previous version, there are:<br>
    <br>
    local opts="$2"<br>
    ...<br>
    <pre wrap="">opts=`echo $opts | sed s/\'/\"/g`

And I want to refactor them but lost the double quotes.

Only do sed operations for useradd and groupadd that they may be passed in "opts" with space but others didn't.

I'll restore to previous version.
</pre>
    Sorry for inconvenience that I built pass on Ubuntu 14.04 so didn't
    find this error.<br>
    <br>
    --Kai<br>
    <br>
    <blockquote
cite="mid:CAJTo0Lbs50h0=46rp2ZV6cv=OgcyBCpfPJh6nvhEFB8HpMQzsA@mail.gmail.com"
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

--------------040603000701030908010108--
