Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CF32470178
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 20:46:35 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 29 Nov 2016 12:46:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,570,1473145200"; 
	d="scan'208,217";a="1065834367"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.5.38])
	([10.219.5.38])
	by orsmga001.jf.intel.com with ESMTP; 29 Nov 2016 12:46:36 -0800
To: Christopher Larson <clarson@kergoth.com>
References: <1480444188-27310-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
	<CABcZANnQ87Q=h4-ponSyGP_-Q8bsRPfMOQ+UZWf0S7i85D2-GQ@mail.gmail.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <2a1fd093-8b07-1e04-4167-f52c0698446e@linux.intel.com>
Date: Tue, 29 Nov 2016 14:52:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CABcZANnQ87Q=h4-ponSyGP_-Q8bsRPfMOQ+UZWf0S7i85D2-GQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sysvinit-inittab: fix getty device removal
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
X-List-Received-Date: Tue, 29 Nov 2016 20:46:36 -0000
Content-Type: multipart/alternative;
	boundary="------------651115AAC4EBE77247DB11AA"

--------------651115AAC4EBE77247DB11AA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/29/2016 02:15 PM, Christopher Larson wrote:
>
> On Tue, Nov 29, 2016 at 11:29 AM, 
> <leonardo.sandoval.gonzalez@linux.intel.com 
> <mailto:leonardo.sandoval.gonzalez@linux.intel.com>> wrote:
>
>     From: Leonardo Sandoval
>     <leonardo.sandoval.gonzalez@linux.intel.com
>     <mailto:leonardo.sandoval.gonzalez@linux.intel.com>>
>
>     getty devices were not being removed in some cases because device name
>     was not at the end of the line, for example a ttyS1 device:
>
>     S1:12345:respawn:/bin/start_getty 115200 ttyS1 vt102
>
>     Removing this limitation allows sed to remove any line containing
>     the device.
>
>     Signed-off-by: Leonardo Sandoval
>     <leonardo.sandoval.gonzalez@linux.intel.com
>     <mailto:leonardo.sandoval.gonzalez@linux.intel.com>>
>     ---
>      meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
>     <http://sysvinit-inittab_2.88dsf.bb> | 2 +-
>      1 file changed, 1 insertion(+), 1 deletion(-)
>
>     diff --git
>     a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
>     <http://sysvinit-inittab_2.88dsf.bb>
>     b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
>     <http://sysvinit-inittab_2.88dsf.bb>
>     index c219cbf..dd30f43 100644
>     --- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
>     <http://sysvinit-inittab_2.88dsf.bb>
>     +++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
>     <http://sysvinit-inittab_2.88dsf.bb>
>     @@ -62,7 +62,7 @@ if [ "x$D" = "x" ] && [ -e /proc/consoles ]; then
>                     k=`echo ${i} | sed s/^.*\://g`
>                     if [ -z "`grep ${j} /proc/consoles`" ]; then
>                             if [ -z "${k}" ] || [ -z "`grep ${k}
>     /proc/consoles`" ] || [ ! -e /dev/${j} ]; then
>     -                               sed -i /^.*${j}$/d /etc/inittab
>     +                               sed -i /^.*${j}/d /etc/inittab
>
>
> This doesn’t check for the end of a word, so it’d match a partial as 
> well. Would that be a problem? i.e. ttyS1 vs ttyS10.

That is the intention, that line removal is not tied to finding the 
device at the end of the line. With proposed patch, it removes the 
device, no matter where is located.


> -- 
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics


--------------651115AAC4EBE77247DB11AA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 11/29/2016 02:15 PM, Christopher
      Larson wrote:<br>
    </div>
    <blockquote
cite="mid:CABcZANnQ87Q=h4-ponSyGP_-Q8bsRPfMOQ+UZWf0S7i85D2-GQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On Tue, Nov 29, 2016 at 11:29 AM, <span
              dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:leonardo.sandoval.gonzalez@linux.intel.com"
                target="_blank">leonardo.sandoval.gonzalez@linux.intel.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":2m0" class="a3s aXjCH m158b154f368e9e70">From:
                Leonardo Sandoval &lt;<a moz-do-not-send="true"
                  href="mailto:leonardo.sandoval.gonzalez@linux.intel.com">leonardo.sandoval.gonzalez@<wbr>linux.intel.com</a>&gt;<br>
                <br>
                getty devices were not being removed in some cases
                because device name<br>
                was not at the end of the line, for example a ttyS1
                device:<br>
                <br>
                S1:12345:respawn:/bin/start_<wbr>getty 115200 ttyS1
                vt102<br>
                <br>
                Removing this limitation allows sed to remove any line
                containing<br>
                the device.<br>
                <br>
                Signed-off-by: Leonardo Sandoval &lt;<a
                  moz-do-not-send="true"
                  href="mailto:leonardo.sandoval.gonzalez@linux.intel.com">leonardo.sandoval.gonzalez@<wbr>linux.intel.com</a>&gt;<br>
                ---<br>
                 meta/recipes-core/sysvinit/<a moz-do-not-send="true"
                  href="http://sysvinit-inittab_2.88dsf.bb"
                  rel="noreferrer" target="_blank">sys<wbr>vinit-inittab_2.88dsf.bb</a>
                | 2 +-<br>
                 1 file changed, 1 insertion(+), 1 deletion(-)<br>
                <br>
                diff --git a/meta/recipes-core/sysvinit/<a
                  moz-do-not-send="true"
                  href="http://sysvinit-inittab_2.88dsf.bb"
                  rel="noreferrer" target="_blank">s<wbr>ysvinit-inittab_2.88dsf.bb</a>
                b/meta/recipes-core/sysvinit/<a moz-do-not-send="true"
                  href="http://sysvinit-inittab_2.88dsf.bb"
                  rel="noreferrer" target="_blank">s<wbr>ysvinit-inittab_2.88dsf.bb</a><br>
                index c219cbf..dd30f43 100644<br>
                --- a/meta/recipes-core/sysvinit/<a
                  moz-do-not-send="true"
                  href="http://sysvinit-inittab_2.88dsf.bb"
                  rel="noreferrer" target="_blank">s<wbr>ysvinit-inittab_2.88dsf.bb</a><br>
                +++ b/meta/recipes-core/sysvinit/<a
                  moz-do-not-send="true"
                  href="http://sysvinit-inittab_2.88dsf.bb"
                  rel="noreferrer" target="_blank">s<wbr>ysvinit-inittab_2.88dsf.bb</a><br>
                @@ -62,7 +62,7 @@ if [ "x$D" = "x" ] &amp;&amp; [ -e
                /proc/consoles ]; then<br>
                                k=`echo ${i} | sed s/^.*\://g`<br>
                                if [ -z "`grep ${j} /proc/consoles`" ];
                then<br>
                                        if [ -z "${k}" ] || [ -z "`grep
                ${k} /proc/consoles`" ] || [ ! -e /dev/${j} ]; then<br>
                -                               sed -i /^.*${j}$/d
                /etc/inittab<br>
                +                               sed -i /^.*${j}/d
                /etc/inittab</div>
            </blockquote>
          </div>
          <br>
          This doesn’t check for the end of a word, so it’d match a
          partial as well. Would that be a problem? i.e. ttyS1 vs
          ttyS10.<br>
        </div>
      </div>
    </blockquote>
    <br>
    That is the intention, that line removal is not tied to finding the
    device at the end of the line. With proposed patch, it removes the
    device, no matter where is located.<br>
    <br>
    <br>
    <blockquote
cite="mid:CABcZANnQ87Q=h4-ponSyGP_-Q8bsRPfMOQ+UZWf0S7i85D2-GQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">-- <br>
          <div class="gmail_signature" data-smartmail="gmail_signature">Christopher
            Larson<br>
            clarson at kergoth dot com<br>
            Founder - BitBake, OpenEmbedded, OpenZaurus<br>
            Maintainer - Tslib<br>
            Senior Software Engineer, Mentor Graphics</div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------651115AAC4EBE77247DB11AA--
