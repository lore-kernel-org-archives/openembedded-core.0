Return-Path: <alejandro.franco@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A14A876FF2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 20:00:47 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 03 Sep 2015 13:00:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,463,1437462000"; 
	d="scan'208,217";a="638054126"
Received: from afshjern.zpn.intel.com (HELO [10.219.128.48]) ([10.219.128.48])
	by orsmga003.jf.intel.com with ESMTP; 03 Sep 2015 13:00:45 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <1441211805-17543-1-git-send-email-alejandro.franco@linux.intel.com>
	<1441216283.24871.78.camel@linuxfoundation.org>
	<20150902182548.GG2470@jama> <55E769B4.4050800@linux.intel.com>
	<CA+chaQddNikh4vveg30U8WVYG5XcpewM9OHrgahzr_qTHSF+pw@mail.gmail.com>
From: Alex Franco <alejandro.franco@linux.intel.com>
Message-ID: <55E8A710.6050003@linux.intel.com>
Date: Thu, 3 Sep 2015 15:01:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQddNikh4vveg30U8WVYG5XcpewM9OHrgahzr_qTHSF+pw@mail.gmail.com>
Cc: Christopher Larson <clarson@kergoth.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Fix recursive mode -st on BUILDDIR setup
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
X-List-Received-Date: Thu, 03 Sep 2015 20:00:50 -0000
Content-Type: multipart/alternative;
	boundary="------------040606070106000201050506"

--------------040606070106000201050506
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Martin, so the error you are seeing is related to the chmodding 
being done in sanity.bbclass, not the chmodding taking place in 
oe-setup-builddir. I am adding a catch and a warning for that, as I 
reproduce your setup so I can also reproduce the OSError.

Alex

On 09/02/2015 07:57 PM, Martin Jansa wrote:
> Warning informing that chmod failed is better than fatal error 
> preventing me to build anything in that setup with tmpfs.
>
> On Wed, Sep 2, 2015 at 11:27 PM, Alex Franco 
> <alejandro.franco@linux.intel.com 
> <mailto:alejandro.franco@linux.intel.com>> wrote:
>
>     Checking may be the better approach, as warning here would do
>     little more than what the current failure does (informing that
>     chmod failed)
>
>     Alex Franco
>
>
>     On 09/02/2015 01:25 PM, Martin Jansa wrote:
>
>         On Wed, Sep 02, 2015 at 06:51:23PM +0100, Richard Purdie wrote:
>
>             On Wed, 2015-09-02 at 11:36 -0500, Alex Franco wrote:
>
>                 Removing recursive option from chmod -st on BUILDDIR
>                 as it would
>                 take very long on existing build directories
>
>                 [YOCTO 7669]
>
>                 Signed-off-by: Alex Franco
>                 <alejandro.franco@linux.intel.com
>                 <mailto:alejandro.franco@linux.intel.com>>
>                 ---
>                   scripts/oe-setup-builddir | 2 +-
>                   1 file changed, 1 insertion(+), 1 deletion(-)
>
>                 diff --git a/scripts/oe-setup-builddir
>                 b/scripts/oe-setup-builddir
>                 index f5b7e4e..44c7dcc 100755
>                 --- a/scripts/oe-setup-builddir
>                 +++ b/scripts/oe-setup-builddir
>                 @@ -24,7 +24,7 @@ if [ -z "$BUILDDIR" ]; then
>                   fi
>                     mkdir -p "$BUILDDIR/conf"
>                 -chmod -R -st "$BUILDDIR"
>                 +chmod -st "$BUILDDIR"
>
>             I think you did this so that conf/ gets the right
>             permissions too.
>             Perhaps the best approach is:
>
>             +chmod -st "$BUILDDIR" $BUILDDIR/conf"
>
>         Can we add "|| bbwarn foo"
>
>         for cases when it doesn't work for whatever reason or check the
>         permissions of these 2 dirs before calling chmod?
>
>             ?
>
>             Cheers,
>
>             Richard
>
>             -- 
>             _______________________________________________
>             Openembedded-core mailing list
>             Openembedded-core@lists.openembedded.org
>             <mailto:Openembedded-core@lists.openembedded.org>
>             http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>


--------------040606070106000201050506
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Hello Martin, so the error you are seeing is related to the
    chmodding being done in sanity.bbclass, not the chmodding taking
    place in oe-setup-builddir. I am adding a catch and a warning for
    that, as I reproduce your setup so I can also reproduce the OSError.<br>
    <br>
    Alex<br>
    <br>
    <div class="moz-cite-prefix">On 09/02/2015 07:57 PM, Martin Jansa
      wrote:<br>
    </div>
    <blockquote
cite="mid:CA+chaQddNikh4vveg30U8WVYG5XcpewM9OHrgahzr_qTHSF+pw@mail.gmail.com"
      type="cite">
      <div dir="ltr">Warning informing that chmod failed is better than
        fatal error preventing me to build anything in that setup with
        tmpfs.
        <div>
          <div class="gmail_extra"><br>
            <div class="gmail_quote">On Wed, Sep 2, 2015 at 11:27 PM,
              Alex Franco <span dir="ltr">&lt;<a moz-do-not-send="true"
                  href="mailto:alejandro.franco@linux.intel.com"
                  target="_blank">alejandro.franco@linux.intel.com</a>&gt;</span>
              wrote:<br>
              <blockquote class="gmail_quote" style="margin:0 0 0
                .8ex;border-left:1px #ccc solid;padding-left:1ex">Checking
                may be the better approach, as warning here would do
                little more than what the current failure does
                (informing that chmod failed)<span class="HOEnZb"><font
                    color="#888888"><br>
                    <br>
                    Alex Franco</font></span>
                <div class="HOEnZb">
                  <div class="h5"><br>
                    <br>
                    On 09/02/2015 01:25 PM, Martin Jansa wrote:<br>
                    <blockquote class="gmail_quote" style="margin:0 0 0
                      .8ex;border-left:1px #ccc solid;padding-left:1ex">
                      On Wed, Sep 02, 2015 at 06:51:23PM +0100, Richard
                      Purdie wrote:<br>
                      <blockquote class="gmail_quote" style="margin:0 0
                        0 .8ex;border-left:1px #ccc
                        solid;padding-left:1ex">
                        On Wed, 2015-09-02 at 11:36 -0500, Alex Franco
                        wrote:<br>
                        <blockquote class="gmail_quote" style="margin:0
                          0 0 .8ex;border-left:1px #ccc
                          solid;padding-left:1ex">
                          Removing recursive option from chmod -st on
                          BUILDDIR as it would<br>
                          take very long on existing build directories<br>
                          <br>
                          [YOCTO 7669]<br>
                          <br>
                          Signed-off-by: Alex Franco &lt;<a
                            moz-do-not-send="true"
                            href="mailto:alejandro.franco@linux.intel.com"
                            target="_blank"><a class="moz-txt-link-abbreviated" href="mailto:alejandro.franco@linux.intel.com">alejandro.franco@linux.intel.com</a></a>&gt;<br>
                          ---<br>
                            scripts/oe-setup-builddir | 2 +-<br>
                            1 file changed, 1 insertion(+), 1
                          deletion(-)<br>
                          <br>
                          diff --git a/scripts/oe-setup-builddir
                          b/scripts/oe-setup-builddir<br>
                          index f5b7e4e..44c7dcc 100755<br>
                          --- a/scripts/oe-setup-builddir<br>
                          +++ b/scripts/oe-setup-builddir<br>
                          @@ -24,7 +24,7 @@ if [ -z "$BUILDDIR" ]; then<br>
                            fi<br>
                              mkdir -p "$BUILDDIR/conf"<br>
                          -chmod -R -st "$BUILDDIR"<br>
                          +chmod -st "$BUILDDIR"<br>
                        </blockquote>
                        I think you did this so that conf/ gets the
                        right permissions too.<br>
                        Perhaps the best approach is:<br>
                        <br>
                        +chmod -st "$BUILDDIR" $BUILDDIR/conf"<br>
                      </blockquote>
                      Can we add "|| bbwarn foo"<br>
                      <br>
                      for cases when it doesn't work for whatever reason
                      or check the<br>
                      permissions of these 2 dirs before calling chmod?<br>
                      <br>
                      <blockquote class="gmail_quote" style="margin:0 0
                        0 .8ex;border-left:1px #ccc
                        solid;padding-left:1ex">
                        ?<br>
                        <br>
                        Cheers,<br>
                        <br>
                        Richard<br>
                        <br>
                        -- <br>
                        _______________________________________________<br>
                        Openembedded-core mailing list<br>
                        <a moz-do-not-send="true"
                          href="mailto:Openembedded-core@lists.openembedded.org"
                          target="_blank">Openembedded-core@lists.openembedded.org</a><br>
                        <a moz-do-not-send="true"
                          href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                          rel="noreferrer" target="_blank">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
                      </blockquote>
                    </blockquote>
                    <br>
                  </div>
                </div>
              </blockquote>
            </div>
            <br>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------040606070106000201050506--
