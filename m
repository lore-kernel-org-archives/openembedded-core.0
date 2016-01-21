Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AD2F3731C0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 09:38:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0L9cQtD020473
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 21 Jan 2016 01:38:26 -0800
Received: from [128.224.162.208] (128.224.162.208) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 21 Jan 2016 01:38:25 -0800
To: Khem Raj <raj.khem@gmail.com>, Robert Yang <liezhi.yang@windriver.com>
References: <cover.1453281406.git.dengke.du@windriver.com>
	<2a8d19d4ef60a323c8770722ec7f60811ced53ca.1453281406.git.dengke.du@windriver.com>
	<1453282408.27999.143.camel@linuxfoundation.org>
	<56A03499.2080703@windriver.com>
	<CAMKF1soSrq1P9ztt5_Uavc7e_jtHtR-PNzYH7PERUE3dJfgeaQ@mail.gmail.com>
From: "dengke.du@windriver.com" <dengke.du@windriver.com>
Message-ID: <56A0A70D.1090103@windriver.com>
Date: Thu, 21 Jan 2016 17:38:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1soSrq1P9ztt5_Uavc7e_jtHtR-PNzYH7PERUE3dJfgeaQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] ncurses: drop the compatible option
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
X-List-Received-Date: Thu, 21 Jan 2016 09:38:29 -0000
Content-Type: multipart/alternative;
	boundary="------------030804040407080507090909"

--------------030804040407080507090909
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

According to the ncurses 6.0 release notes (the site is at 
"https://www.gnu.org/software/ncurses/"), the intent of the release is 
to provide a new stable ABI,
which is binary-incompatible with ncurses 5, but it can still be 
configured to support the ncurses5.  Because this release introduces 
symbol-versioning.
The symbol-versioning allows the developers of a library to mark each 
public sysmbol(both data and functions) with an identifier denoting the 
library name and
the version for which it was built. By doing this , users of the library 
have a way to help ensure that applications do not accidentally load an 
imcompatible library.
In addition, private sysmbols can be hidden entirely.
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
When I first release the patch 5.9 -> 6.0  with the option 
--with-abi-version=5, I want to be compatible with the existing system, 
so I do the following test:

     $bitbake world core-image-sato-sdk

tested it on the qemuarm, qemux86, qemux86-64 with multilib (oe-core), 
and no error happened .

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
When I second release the patch "drop the compatible option 
--with-abi-version=5", because I want to introduces the feature 
symbol-versioning, so I droped the
option --with-abi-version=5 , and I do the following test:

     $bitbake world core-image-sato-sdk

tested it on the qemuarm, qemux86, qemux86-64 with multilib (oe-core), 
and no error happened.

Today, Robert let me test it on the following layers:

     /meta-openembedded/meta-oe
     /meta-openembedded/meta-networking
/meta-openembedded/meta-meta-webserver

so I add the layers to my build and run the following commands:

     $bitbake world

It reported the following error:

     Summary: 15 tasks failed:
/buildarea/raid0/ddu/poky/meta-openembedded/meta-oe/recipes-graphics/takao-fonts/takao-fonts_003.03.01.bb, 
do_fetch
/buildarea/raid0/ddu/poky/meta-openembedded/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb, 
do_fetch
/buildarea/raid0/ddu/poky/meta-openembedded/meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb, 
do_fetch
/buildarea/raid0/ddu/poky/meta-openembedded/meta-python/recipes-devtools/python/python-cryptography-vectors_1.1.bb, 
do_fetch
/buildarea/raid0/ddu/poky/meta-openembedded/meta-networking/recipes-support/geoip/geoip_1.6.6.bb, 
do_fetch
/buildarea/raid0/ddu/poky/meta-openembedded/meta-networking/recipes-connectivity/ufw/ufw_0.33.bb, 
do_fetch
/buildarea/raid0/ddu/poky/meta-openembedded/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-11.bb, 
do_fetch
/buildarea/raid0/ddu/poky/meta-openembedded/meta-python/recipes-devtools/python/python-decorator_4.0.2.bb, 
do_fetch
/buildarea/raid0/ddu/poky/meta-openembedded/meta-python/recipes-connectivity/python-thrift/python-thrift_0.9.2.bb, 
do_fetch
/buildarea/raid0/ddu/poky/meta-openembedded/meta-python/recipes-devtools/python/python-sqlalchemy_0.7.9.bb, 
do_fetch
/buildarea/raid0/ddu/poky/meta-openembedded/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb, 
do_fetch
/buildarea/raid0/ddu/poky/meta-openembedded/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb, 
do_fetch
virtual:native:/buildarea/raid0/ddu/poky/meta-openembedded/meta-oe/recipes-support/uim/uim_1.8.6.bb, 
do_install
/buildarea/raid0/ddu/poky/meta-openembedded/meta-oe/recipes-connectivity/umip/umip_1.0.bb, 
do_compile
/buildarea/raid0/ddu/poky/meta-openembedded/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb, 
do_package_qa

It seems the umip was affect by the ncurses version change. So I went to 
the log.do_compile, the log file say:

fatal error: gram.h : No such file or directory
compilation terminated

So I think the ncurses version change didn't affect the whole system. 
Then I release the patch "ncurses: drop the compatible option"
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
On 2016年01月21日 10:17, Khem Raj wrote:
> On Wed, Jan 20, 2016 at 5:30 PM, Robert Yang<liezhi.yang@windriver.com>  wrote:
>> I had talked with Dengke, we have upgraded ncurses to 6, so remove
>> --with-abi-version=5 seems better. He had tested world and sdk
>> build based on oe-core. He will test it based on meta-openembedded.
> we need to ensure that all apps using ncurses are able to work with
> new APIs if we drop compatibility.
> may be have ncurses5 package still around to provide backward compatibility.



On 2016年01月21日 10:17, Khem Raj wrote:
> On Wed, Jan 20, 2016 at 5:30 PM, Robert Yang <liezhi.yang@windriver.com> wrote:
>> I had talked with Dengke, we have upgraded ncurses to 6, so remove
>> --with-abi-version=5 seems better. He had tested world and sdk
>> build based on oe-core. He will test it based on meta-openembedded.
> we need to ensure that all apps using ncurses are able to work with
> new APIs if we drop compatibility.
> may be have ncurses5 package still around to provide backward compatibility.


--------------030804040407080507090909
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-text-html" lang="x-unicode"> According to the
      ncurses 6.0 release notes (the site is at <a
        class="moz-txt-link-rfc2396E"
        href="https://www.gnu.org/software/ncurses/"><a class="moz-txt-link-rfc2396E" href="https://www.gnu.org/software/ncurses/">"https://www.gnu.org/software/ncurses/"</a></a>),
      the intent of the release is to provide a new stable ABI, <br>
      which is binary-incompatible with ncurses 5, <font
        color="#3333ff">but it can still be configured to support the
        ncurses5</font>.  Because this release introduces <font
        color="#3333ff">symbol-versioning</font>. <br>
      The <font color="#3333ff">symbol-versioning </font>allows the
      developers of a library to mark each public sysmbol(both data and
      functions) with an identifier denoting the library name and <br>
      the version for which it was built. By doing this , users of the
      library have a way to help ensure that applications do not
      accidentally load an imcompatible library. <br>
      In addition, private sysmbols can be hidden entirely.<br>
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br>
      When I first release the patch 5.9 -&gt; 6.0  with the option
      --with-abi-version=5, I want to be compatible with the existing
      system, so I do the following test:<br>
      <br>
          $bitbake world core-image-sato-sdk<br>
      <br>
      tested it on the qemuarm, qemux86, qemux86-64 with multilib
      (oe-core), and no error happened .<br>
      <br>
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br>
      When I second release the patch "drop the compatible option
      --with-abi-version=5", because I want to introduces the feature <font
        color="#3333ff">symbol-versioning<font color="#000000">, so I
          droped the <br>
          option --with-abi-version=5 , and I do the following test:<br>
          <br>
              $bitbake world core-image-sato-sdk<br>
          <br>
          tested it on the qemuarm, qemux86, qemux86-64 with multilib
          (oe-core), and no error happened.<br>
          <br>
          Today, Robert let me test it on the following layers:<br>
          <br>
              /meta-openembedded/meta-oe <br>
              /meta-openembedded/meta-networking<br>
        </font></font><font color="#3333ff"><font color="#000000"><font
            color="#3333ff"><font color="#000000">   
              /meta-openembedded/meta-meta-webserver</font></font><font
            color="#3333ff"><font color="#000000"><i
                class="moz-txt-slash"><span class="moz-txt-tag"><br>
                </span></i></font></font><br>
          so I add the layers to my build and run the following
          commands:<br>
          <br>
              $bitbake world<br>
          <br>
          It reported the following error:<br>
          <font color="#3333ff"><br>
                Summary: 15 tasks failed:<br>
             
            /buildarea/raid0/ddu/poky/meta-openembedded/meta-oe/recipes-graphics/takao-fonts/takao-fonts_003.03.01.bb,

            do_fetch<br>
             
            /buildarea/raid0/ddu/poky/meta-openembedded/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb,

            do_fetch<br>
             
            /buildarea/raid0/ddu/poky/meta-openembedded/meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb,

            do_fetch<br>
             
            /buildarea/raid0/ddu/poky/meta-openembedded/meta-python/recipes-devtools/python/python-cryptography-vectors_1.1.bb,

            do_fetch<br>
             
            /buildarea/raid0/ddu/poky/meta-openembedded/meta-networking/recipes-support/geoip/geoip_1.6.6.bb,

            do_fetch<br>
             
            /buildarea/raid0/ddu/poky/meta-openembedded/meta-networking/recipes-connectivity/ufw/ufw_0.33.bb,

            do_fetch<br>
             
            /buildarea/raid0/ddu/poky/meta-openembedded/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-11.bb,

            do_fetch<br>
             
            /buildarea/raid0/ddu/poky/meta-openembedded/meta-python/recipes-devtools/python/python-decorator_4.0.2.bb,

            do_fetch<br>
             
            /buildarea/raid0/ddu/poky/meta-openembedded/meta-python/recipes-connectivity/python-thrift/python-thrift_0.9.2.bb,

            do_fetch<br>
             
            /buildarea/raid0/ddu/poky/meta-openembedded/meta-python/recipes-devtools/python/python-sqlalchemy_0.7.9.bb,

            do_fetch<br>
             
            /buildarea/raid0/ddu/poky/meta-openembedded/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb,

            do_fetch<br>
             
            /buildarea/raid0/ddu/poky/meta-openembedded/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb,

            do_fetch<br>
             
            virtual:native:/buildarea/raid0/ddu/poky/meta-openembedded/meta-oe/recipes-support/uim/uim_1.8.6.bb,

            do_install<br>
            <font color="#cc0000"> 
              /buildarea/raid0/ddu/poky/meta-openembedded/meta-oe/recipes-connectivity/umip/umip_1.0.bb,

              do_compile</font><br>
             
            /buildarea/raid0/ddu/poky/meta-openembedded/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb,

            do_package_qa</font><br>
          <br>
          It seems the umip was affect by the ncurses version change. So
          I went to the log.do_compile, the log file say:<br>
          <br>
          <font color="#cc0000">fatal error: gram.h : No such file or
            directory<br>
            compilation terminated</font><br>
          <br>
          So I think the ncurses version change didn't affect the whole
          system. Then I release the patch "ncurses: drop the compatible
          option"</font></font><font color="#3333ff"><font
          color="#000000"><i class="moz-txt-slash"><span
              class="moz-txt-tag"><br>
            </span><span class="moz-txt-tag"></span></i>-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br>
        </font></font>
      <div class="moz-cite-prefix">On 2016年01月21日 10:17, Khem Raj wrote:<br>
      </div>
      <blockquote
cite="mid:CAMKF1soSrq1P9ztt5_Uavc7e_jtHtR-PNzYH7PERUE3dJfgeaQ@mail.gmail.com"
        type="cite">
        <pre wrap="">On Wed, Jan 20, 2016 at 5:30 PM, Robert Yang <a class="moz-txt-link-rfc2396E" href="mailto:liezhi.yang@windriver.com">&lt;liezhi.yang@windriver.com&gt;</a> wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="">I had talked with Dengke, we have upgraded ncurses to 6, so remove
--with-abi-version=5 seems better. He had tested world and sdk
build based on oe-core. He will test it based on meta-openembedded.
</pre>
        </blockquote>
        <pre wrap="">we need to ensure that all apps using ncurses are able to work with
new APIs if we drop compatibility.
may be have ncurses5 package still around to provide backward compatibility.
</pre>
      </blockquote>
      <br>
    </div>
    <br>
    <br>
    <div class="moz-cite-prefix">On 2016年01月21日 10:17, Khem Raj wrote:<br>
    </div>
    <blockquote
cite="mid:CAMKF1soSrq1P9ztt5_Uavc7e_jtHtR-PNzYH7PERUE3dJfgeaQ@mail.gmail.com"
      type="cite">
      <pre wrap="">On Wed, Jan 20, 2016 at 5:30 PM, Robert Yang <a class="moz-txt-link-rfc2396E" href="mailto:liezhi.yang@windriver.com">&lt;liezhi.yang@windriver.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">
I had talked with Dengke, we have upgraded ncurses to 6, so remove
--with-abi-version=5 seems better. He had tested world and sdk
build based on oe-core. He will test it based on meta-openembedded.
</pre>
      </blockquote>
      <pre wrap="">
we need to ensure that all apps using ncurses are able to work with
new APIs if we drop compatibility.
may be have ncurses5 package still around to provide backward compatibility.
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------030804040407080507090909--
