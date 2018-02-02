Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EDC4C71951
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Feb 2018 02:09:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w1229veR011554
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 1 Feb 2018 18:09:57 -0800 (PST)
Received: from [128.224.162.145] (128.224.162.145) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 1 Feb 2018 18:09:56 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1515744181.git.hongxu.jia@windriver.com>
	<df3d49ef2f1fa5243b2e8d430a7edfa956cc9f8d.1515744181.git.hongxu.jia@windriver.com>
	<CAJTo0LZ_Q0KGZFg1u-Noky+hhz1yDfU6axX9ZdA1Rj07fQW8ng@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <e47317b0-91c5-d64a-d11a-51f614d630b6@windriver.com>
Date: Fri, 2 Feb 2018 10:13:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ_Q0KGZFg1u-Noky+hhz1yDfU6axX9ZdA1Rj07fQW8ng@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/6] python3-core: improve reproducibility
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
X-List-Received-Date: Fri, 02 Feb 2018 02:09:57 -0000
Content-Type: multipart/alternative;
	boundary="------------8A1E14257832050A98F09588"
Content-Language: en-US

--------------8A1E14257832050A98F09588
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2018年02月02日 03:27, Burton, Ross wrote:
> On 12 January 2018 at 08:11, Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>> wrote:
>
>     +  # Recompile _sysconfigdata after modifying it
>     +       cd ${PKGD}
>     +       ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \
>     +            -c "from py_compile import compile;
>     compile('./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py')"
>     +       ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \
>     +            -c "from py_compile import compile;
>     compile('./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py',
>     optimize=1)"
>     +       ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \
>     +            -c "from py_compile import compile;
>     compile('./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py',
>     optimize=2)"
>     +       cd -
>
>
> Do we really need to generate optimise=1 and optimise=2 variants for a 
> file which is just data?
>

Yes, with a simple search in ${D}, any py file has a triples pyc

$ find image/ -name "site.cpython-35*"
image/usr/lib64/python3.5/__pycache__/site.cpython-35.pyc
image/usr/lib64/python3.5/__pycache__/site.cpython-35.opt-1.pyc
image/usr/lib64/python3.5/__pycache__/site.cpython-35.opt-2.pyc

If we do not require to generate so many duplicate optimize file,
I could improve python3's do_install process, but I am not sure
it is really necessary.

> I'd suggest something like this would be neater:
>
> rm -f ${PKGD}/${libdir}/python*/__pycache__/_sysconfigdata.*
> nativepython -m py_compile ${PKGD}/${libdir}/python*/_sysconfigdata.py
>

I ust refer distutil* bbclass in oe-core.

//Hongxu

> Ross



--------------8A1E14257832050A98F09588
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2018年02月02日 03:27, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0LZ_Q0KGZFg1u-Noky+hhz1yDfU6axX9ZdA1Rj07fQW8ng@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">On 12 January 2018 at 08:11, Hongxu Jia <span
          dir="ltr">&lt;<a href="mailto:hongxu.jia@windriver.com"
            target="_blank" moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;</span>
        wrote:<br>
        <div class="gmail_extra">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">+     
               # Recompile _sysconfigdata after modifying it<br>
              +       cd ${PKGD}<br>
              +       ${STAGING_BINDIR_NATIVE}/${<wbr>PYTHON_PN}-native/${PYTHON_PN}
              \<br>
              +            -c "from py_compile import compile;
              compile('./${libdir}/python${<wbr>PYTHON_MAJMIN}/_sysconfigdata.<wbr>py')"<br>
              +       ${STAGING_BINDIR_NATIVE}/${<wbr>PYTHON_PN}-native/${PYTHON_PN}
              \<br>
              +            -c "from py_compile import compile;
              compile('./${libdir}/python${<wbr>PYTHON_MAJMIN}/_sysconfigdata.<wbr>py',
              optimize=1)"<br>
              +       ${STAGING_BINDIR_NATIVE}/${<wbr>PYTHON_PN}-native/${PYTHON_PN}
              \<br>
              +            -c "from py_compile import compile;
              compile('./${libdir}/python${<wbr>PYTHON_MAJMIN}/_sysconfigdata.<wbr>py',
              optimize=2)"<br>
              +       cd -<br>
            </blockquote>
            <div><br>
            </div>
            <div>Do we really need to generate optimise=1 and optimise=2
              variants for a file which is just data?</div>
            <div><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Yes, with a simple search in ${D}, any py file has a <span
      style="color: rgb(51, 51, 51); font-family: arial, sans-serif,
      &quot;microsoft yahei&quot;, simhei; font-size: 16px; font-style:
      normal; font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;">triples pyc</span><br>
    <br>
    $ find image/ -name "site.cpython-35*"<br>
    image/usr/lib64/python3.5/__pycache__/site.cpython-35.pyc<br>
    image/usr/lib64/python3.5/__pycache__/site.cpython-35.opt-1.pyc<br>
    image/usr/lib64/python3.5/__pycache__/site.cpython-35.opt-2.pyc<br>
    <br>
    If we do not require to generate so many duplicate optimize file,<br>
    I could improve python3's do_install process, but I am not sure<br>
    it is really necessary.<br>
    <br>
    <blockquote type="cite"
cite="mid:CAJTo0LZ_Q0KGZFg1u-Noky+hhz1yDfU6axX9ZdA1Rj07fQW8ng@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div>I'd suggest something like this would be neater:</div>
            <div><br>
            </div>
            <div>rm -f
              ${PKGD}/${libdir}/python*/__pycache__/_sysconfigdata.*</div>
            <div>nativepython -m py_compile
              ${PKGD}/${libdir}/python*/_sysconfigdata.py</div>
            <div><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    I ust refer distutil* bbclass in oe-core.<br>
    <br>
    //Hongxu<br>
    <br>
    <blockquote type="cite"
cite="mid:CAJTo0LZ_Q0KGZFg1u-Noky+hhz1yDfU6axX9ZdA1Rj07fQW8ng@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div>Ross</div>
          </div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------8A1E14257832050A98F09588--
