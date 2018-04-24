Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2383F6FFC7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2018 01:44:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w3O1ili1004991
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 23 Apr 2018 18:44:48 -0700 (PDT)
Received: from [128.224.162.165] (128.224.162.165) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 23 Apr 2018 18:44:40 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <1524471238-4908-1-git-send-email-hongxu.jia@windriver.com>
	<df7a7e3b-09a9-26ac-8969-bc369f9bc2c4@windriver.com>
	<1524521143.18865.174.camel@linuxfoundation.org>
	<CADkTA4NhgDeZQKr-6iZL-yw_ijW6W0Pr2Vq7_wMTzucGqno_XA@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <2b6b31dc-bca1-65df-7b4b-698703786d98@windriver.com>
Date: Tue, 24 Apr 2018 09:44:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4NhgDeZQKr-6iZL-yw_ijW6W0Pr2Vq7_wMTzucGqno_XA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] perf: make a copy of kernel source to perf workdir
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
X-List-Received-Date: Tue, 24 Apr 2018 01:44:52 -0000
Content-Type: multipart/alternative;
	boundary="------------7B3D052B9C6B9CC744433080"
Content-Language: en-US

--------------7B3D052B9C6B9CC744433080
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2018年04月24日 08:45, Bruce Ashfield wrote:
>
>
> On Mon, Apr 23, 2018 at 6:05 PM, Richard Purdie 
> <richard.purdie@linuxfoundation.org 
> <mailto:richard.purdie@linuxfoundation.org>> wrote:
>
>     On Mon, 2018-04-23 at 13:51 -0400, Bruce Ashfield wrote:
>     > On 2018-04-23 4:13 AM, Hongxu Jia wrote:
>     > >
>     > > Since perf modify kernel source which shared by multiple
>     > > recipes, it probably caused kernel-devsrc compile failure
>     > > at world build.
>     > > ...
>     > > >
>     > > > 0 blocks
>     > > > cpio: ./tools/perf/arch/arm/util/sedr7ORqk: Cannot stat:
>     > > No such file or directory
>     > > >
>     > > > 0 blocks
>     > > ...
>     > > cpio tried to find a file at ${S}/tools/perf and failed
>     > > if the input list is not valid.
>     > >
>     > > Make a copy of kernel shared source directory into a perf workdir
>     > > could fix the issue.
>     > >
>     > > Drop `Fix for rebuilding' which is obsolete
>     > >
>     > > Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     > > ---
>     > >   meta/recipes-kernel/perf/perf.bb <http://perf.bb> | 11
>     ++++++-----
>     > >   1 file changed, 6 insertions(+), 5 deletions(-)
>     > >
>     > > diff --git a/meta/recipes-kernel/perf/perf.bb <http://perf.bb>
>     b/meta/recipes-
>     > > kernel/perf/perf.bb <http://perf.bb>
>     > > index 872b5f0..8b40806 100644
>     > > --- a/meta/recipes-kernel/perf/perf.bb <http://perf.bb>
>     > > +++ b/meta/recipes-kernel/perf/perf.bb <http://perf.bb>
>     > > @@ -61,7 +61,7 @@ export PERL_ARCHLIB =
>     "${STAGING_LIBDIR}${PERL_OW
>     > > N_DIR}/perl/${@get_perl_version
>     > >
>     > >   inherit kernelsrc
>     > >
>     > > -B = "${WORKDIR}/${BPN}-${PV}"
>     > > +S = "${WORKDIR}/${BP}"
>     > >   SPDX_S = "${S}/tools/perf"
>     > >
>     > >   # The LDFLAGS is required or some old kernels fails due missing
>     > > @@ -119,11 +119,12 @@ do_install() {
>     > >     fi
>     > >   }
>     > >
>     > > -do_configure_prepend () {
>     > > -    # Fix for rebuilding
>     > > -    rm -rf ${B}/
>     > > -    mkdir -p ${B}/
>     > > +do_configure[prefuncs] += "git_clone_kernel_source"
>     > > +git_clone_kernel_source () {
>     > > +    git clone --single-branch ${STAGING_KERNEL_DIR} ${S}
>     > I probably would have used "cp -a -r", or similar. Since it
>     > is possible that a kernel may not actually be a git repo
>     (linux-yocto
>     > always is, but that is just one data point).
>     >
>     > Also, did you try just copying the tools SRC dir + whatever
>     > infrastructure is needed to build ? That will save us a LOT
>     > of i/o when moving the source around for perf to build.
>     >
>

OK, I will copy the perf used src dir rather than the entire project source.

>     > But outside of those details/mechanics, the approach is sound.
>
>     Our "copy hardlink tree" function, whatever its called is sometimes of
>     use in these cases...
>

Got it, I will use oe.path.copyhardlinktree

//Hongxu

>     I think I'm the current owner of a bug in this area which I've sadly
>     not gotten to yet :(.
>
>     Also, have we considered the alternative - not copying tools/perf for
>     the kernel devsrc?
>
>
> We could, but sometimes the devsrc is actually used to build the tools.
> I know that I have used it to build perf in the past.
>
> It is mostly skipped in my rewritten version (which I'll resubmit 
> after 2.5
> releases). So for now, I'm thinking the smallest footprint change makes
> the most sense (as to which that is, that is probably not black and 
> white).
>
> Bruce
>
>
>     Cheers,
>
>     Richard
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>
>
>
> -- 
> "Thou shalt not follow the NULL pointer, for chaos and madness await 
> thee at its end"



--------------7B3D052B9C6B9CC744433080
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2018年04月24日 08:45, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CADkTA4NhgDeZQKr-6iZL-yw_ijW6W0Pr2Vq7_wMTzucGqno_XA@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr"><br>
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On Mon, Apr 23, 2018 at 6:05 PM,
            Richard Purdie <span dir="ltr">&lt;<a
                href="mailto:richard.purdie@linuxfoundation.org"
                target="_blank" moz-do-not-send="true">richard.purdie@linuxfoundation.org</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div class="HOEnZb">
                <div class="h5">On Mon, 2018-04-23 at 13:51 -0400, Bruce
                  Ashfield wrote:<br>
                  &gt; On 2018-04-23 4:13 AM, Hongxu Jia wrote:<br>
                  &gt; &gt; <br>
                  &gt; &gt; Since perf modify kernel source which shared
                  by multiple<br>
                  &gt; &gt; recipes, it probably caused kernel-devsrc
                  compile failure<br>
                  &gt; &gt; at world build.<br>
                  &gt; &gt; ...<br>
                  &gt; &gt; &gt; <br>
                  &gt; &gt; &gt; 0 blocks<br>
                  &gt; &gt; &gt; cpio: ./tools/perf/arch/arm/util/<wbr>sedr7ORqk:
                  Cannot stat:<br>
                  &gt; &gt; No such file or directory<br>
                  &gt; &gt; &gt; <br>
                  &gt; &gt; &gt; 0 blocks<br>
                  &gt; &gt; ...<br>
                  &gt; &gt; cpio tried to find a file at ${S}/tools/perf
                  and failed<br>
                  &gt; &gt; if the input list is not valid.<br>
                  &gt; &gt; <br>
                  &gt; &gt; Make a copy of kernel shared source
                  directory into a perf workdir<br>
                  &gt; &gt; could fix the issue.<br>
                  &gt; &gt; <br>
                  &gt; &gt; Drop `Fix for rebuilding' which is obsolete<br>
                  &gt; &gt; <br>
                  &gt; &gt; Signed-off-by: Hongxu Jia &lt;<a
                    href="mailto:hongxu.jia@windriver.com"
                    moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;<br>
                  &gt; &gt; ---<br>
                  &gt; &gt;   meta/recipes-kernel/perf/<a
                    href="http://perf.bb" rel="noreferrer"
                    target="_blank" moz-do-not-send="true">perf.<wbr>bb</a>
                  | 11 ++++++-----<br>
                  &gt; &gt;   1 file changed, 6 insertions(+), 5
                  deletions(-)<br>
                  &gt; &gt; <br>
                  &gt; &gt; diff --git a/meta/recipes-kernel/perf/<a
                    href="http://perf.bb" rel="noreferrer"
                    target="_blank" moz-do-not-send="true">per<wbr>f.bb</a>
                  b/meta/recipes-<br>
                  &gt; &gt; kernel/perf/<a href="http://perf.bb"
                    rel="noreferrer" target="_blank"
                    moz-do-not-send="true">perf.bb</a><br>
                  &gt; &gt; index 872b5f0..8b40806 100644<br>
                  &gt; &gt; --- a/meta/recipes-kernel/perf/<a
                    href="http://perf.bb" rel="noreferrer"
                    target="_blank" moz-do-not-send="true">per<wbr>f.bb</a><br>
                  &gt; &gt; +++ b/meta/recipes-kernel/perf/<a
                    href="http://perf.bb" rel="noreferrer"
                    target="_blank" moz-do-not-send="true">per<wbr>f.bb</a><br>
                  &gt; &gt; @@ -61,7 +61,7 @@ export PERL_ARCHLIB =
                  "${STAGING_LIBDIR}${PERL_OW<br>
                  &gt; &gt; N_DIR}/perl/${@get_perl_<wbr>version<br>
                  &gt; &gt;   <br>
                  &gt; &gt;   inherit kernelsrc<br>
                  &gt; &gt;   <br>
                  &gt; &gt; -B = "${WORKDIR}/${BPN}-${PV}"<br>
                  &gt; &gt; +S = "${WORKDIR}/${BP}"<br>
                  &gt; &gt;   SPDX_S = "${S}/tools/perf"<br>
                  &gt; &gt;   <br>
                  &gt; &gt;   # The LDFLAGS is required or some old
                  kernels fails due missing<br>
                  &gt; &gt; @@ -119,11 +119,12 @@ do_install() {<br>
                  &gt; &gt;     fi<br>
                  &gt; &gt;   }<br>
                  &gt; &gt;   <br>
                  &gt; &gt; -do_configure_prepend () {<br>
                  &gt; &gt; -    # Fix for rebuilding<br>
                  &gt; &gt; -    rm -rf ${B}/<br>
                  &gt; &gt; -    mkdir -p ${B}/<br>
                  &gt; &gt; +do_configure[prefuncs] +=
                  "git_clone_kernel_source"<br>
                  &gt; &gt; +git_clone_kernel_source () {<br>
                  &gt; &gt; +    git clone --single-branch
                  ${STAGING_KERNEL_DIR} ${S}<br>
                  &gt; I probably would have used "cp -a -r", or
                  similar. Since it<br>
                  &gt; is possible that a kernel may not actually be a
                  git repo (linux-yocto<br>
                  &gt; always is, but that is just one data point).<br>
                  &gt; <br>
                  &gt; Also, did you try just copying the tools SRC dir
                  + whatever<br>
                  &gt; infrastructure is needed to build ? That will
                  save us a LOT<br>
                  &gt; of i/o when moving the source around for perf to
                  build.<br>
                  &gt; <br>
                </div>
              </div>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    OK, I will copy the perf used src dir rather than the entire project
    source.<br>
    <br>
    <blockquote type="cite"
cite="mid:CADkTA4NhgDeZQKr-6iZL-yw_ijW6W0Pr2Vq7_wMTzucGqno_XA@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div class="HOEnZb">
                <div class="h5">
                  &gt; But outside of those details/mechanics, the
                  approach is sound.<br>
                  <br>
                </div>
              </div>
              Our "copy hardlink tree" function, whatever its called is
              sometimes of<br>
              use in these cases...<br>
              <br>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Got it, I will use oe.path.copyhardlinktree<br>
    <br>
    //Hongxu<br>
    <br>
    <blockquote type="cite"
cite="mid:CADkTA4NhgDeZQKr-6iZL-yw_ijW6W0Pr2Vq7_wMTzucGqno_XA@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              I think I'm the current owner of a bug in this area which
              I've sadly<br>
              not gotten to yet :(.<br>
              <br>
              Also, have we considered the alternative - not copying
              tools/perf for<br>
              the kernel devsrc?<br>
            </blockquote>
            <div><br>
            </div>
            <div>We could, but sometimes the devsrc is actually used to
              build the tools.</div>
            <div>I know that I have used it to build perf in the past.</div>
            <div><br>
            </div>
            <div>It is mostly skipped in my rewritten version (which
              I'll resubmit after 2.5</div>
            <div>releases). So for now, I'm thinking the smallest
              footprint change makes</div>
            <div>the most sense (as to which that is, that is probably
              not black and white).</div>
            <div><br>
            </div>
            <div>Bruce</div>
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <br>
              Cheers,<br>
              <br>
              Richard<br>
              <div class="HOEnZb">
                <div class="h5">-- <br>
                  ______________________________<wbr>_________________<br>
                  Openembedded-core mailing list<br>
                  <a
                    href="mailto:Openembedded-core@lists.openembedded.org"
                    moz-do-not-send="true">Openembedded-core@lists.<wbr>openembedded.org</a><br>
                  <a
                    href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                    rel="noreferrer" target="_blank"
                    moz-do-not-send="true">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
                </div>
              </div>
            </blockquote>
          </div>
          <br>
          <br clear="all">
          <div><br>
          </div>
          -- <br>
          <div class="gmail_signature" data-smartmail="gmail_signature">"Thou
            shalt not follow the NULL pointer, for chaos and madness
            await thee at its end"</div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------7B3D052B9C6B9CC744433080--
