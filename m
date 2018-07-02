Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 51DA1755BB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2018 02:05:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6225Zxq027148
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 1 Jul 2018 19:05:35 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Sun, 1 Jul 2018 19:05:34 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <969ccd61-7a03-a81f-c36f-04c5d806d3e2@windriver.com>
	<CA+chaQd7LE8y7-xzsPTa0CYS9bq-94MwGE=hFbtgz3odkq-d0g@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <04cbb0a5-d680-3843-b3a7-9e308c0e10e0@windriver.com>
Date: Mon, 2 Jul 2018 10:05:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQd7LE8y7-xzsPTa0CYS9bq-94MwGE=hFbtgz3odkq-d0g@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] How to deal allarch packages in dependency chain for multilib rootfs?
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
X-List-Received-Date: Mon, 02 Jul 2018 02:05:35 -0000
Content-Type: multipart/alternative;
	boundary="------------85ABDB261F0595FD32F5A0F2"
Content-Language: en-US

--------------85ABDB261F0595FD32F5A0F2
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Martin,

On 2018年06月28日 19:13, Martin Jansa wrote:
> In our build I've removed the openssl runtime dependency 
> (RDEPENDS_${PN}_remove = "openssl"), because we pull the right version 
> of openssl (lib32-openssl in our case) to the image elsewhere.

Thanks for your reply.

We have too many different kind of images so it can't be assured that 
lib32-openssl will be installed to image. And there are also other 
noarch packages such as docbook-xsl-stylesheets which depends on perl.
It is better to have a common solution.

Thanks,
Kai

>
> On Thu, Jun 28, 2018 at 10:48 AM Kang Kai <Kai.Kang@windriver.com 
> <mailto:Kai.Kang@windriver.com>> wrote:
>
>     Hi all,
>
>     When build 32 bits rootfs with 64 bits bsp, if an allarch/noarch
>     package is installed to lib32 rootfs, it causes
>     unexpected 64 bits packages which is required by the allarch
>     package installed to lib32 rootfs.
>
>     Take ca-certificates as example. ca-certificates rdepends on
>     openssl, so if ca-certificates is installed to image,
>     64 bits package openssl will be installed too no matter what the
>     rootfs is. But only 32 bits openssl package should
>     be installed to 32 bits rootfs.
>
>     There are 2 ways to fixed the issue.
>
>     1 expand allarch/noarch packages with multilib. So if add
>     ca-certificates to image, lib32-ca-certificates will be
>        installed to 32bits rootfs. And then also the dependency
>     lib32-openssl is installed. That is what we expected.
>
>     2 expand DEPENDS/RDEPENDS of allarch/noarch packages with a prefix
>     'noarch-' when multilib is enabled. So then
>     ca-certificates requires 'noarch-openssl'. And make both
>     lib32-openssl and openssl provides 'noarch-openssl'.
>        When do_rootfs, there is only one rpm repo 'oe-rootfs-repo'
>     now. We will create repos with different priorities
>        according to different archs/subdirectories. For 32 bits image,
>     make 32 bits rpm repo has higher priority, so lib32-openssl
>        will be installed to 32 bits rootfs rather than 64bits.
>
>     I know these 2 ways are not perfect, but only possible ways I have
>     in mind to solve the problem.
>
>     Any comment or suggestion is greatly appreciated. Thanks a lot.
>
>     -- 
>     Regards,
>     Neil | Kai Kang
>
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

-- 
Regards,
Neil | Kai Kang


--------------85ABDB261F0595FD32F5A0F2
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">Hi Martin,<br>
      <br>
      On 2018年06月28日 19:13, Martin Jansa wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CA+chaQd7LE8y7-xzsPTa0CYS9bq-94MwGE=hFbtgz3odkq-d0g@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">In our build I've removed the openssl runtime
        dependency (RDEPENDS_${PN}_remove = "openssl"), because we pull
        the right version of openssl (lib32-openssl in our case) to the
        image elsewhere.</div>
    </blockquote>
    <br>
    Thanks for your reply.<br>
    <br>
    We have too many different kind of images so it can't be assured
    that lib32-openssl will be installed to image. And there are also
    other noarch packages such as docbook-xsl-stylesheets which depends
    on perl.<br>
    It is better to have a common solution.<br>
    <br>
    Thanks,<br>
    Kai<br>
    <br>
    <blockquote type="cite"
cite="mid:CA+chaQd7LE8y7-xzsPTa0CYS9bq-94MwGE=hFbtgz3odkq-d0g@mail.gmail.com"><br>
      <div class="gmail_quote">
        <div dir="ltr">On Thu, Jun 28, 2018 at 10:48 AM Kang Kai &lt;<a
            href="mailto:Kai.Kang@windriver.com" moz-do-not-send="true">Kai.Kang@windriver.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">
          <div text="#000000" bgcolor="#FFFFFF">
            <p><font size="+1">Hi all,</font></p>
            <p><font size="+1">When build </font><font size="+1"><font
                  size="+1">32 bits rootfs with </font>64 bits bsp, if
                an allarch/noarch package is installed to lib32 rootfs,
                it causes<br>
                unexpected 64 bits packages which is required by the
                allarch package installed to lib32 rootfs.</font></p>
            <p><font size="+1">Take ca-certificates as example. </font><font
                size="+1"><font size="+1">ca-certificates rdepends on
                  openssl, so if </font></font><font size="+1"><font
                  size="+1"><font size="+1"><font size="+1">ca-certificates
                      is installed to image,<br>
                      64 bits package openssl will be installed too no
                      matter what the rootfs is. But only 32 bits
                      openssl package should<br>
                      be installed to 32 bits rootfs.</font></font></font></font></p>
            <p><font size="+1"><font size="+1"><font size="+1"><font
                      size="+1">There are 2 ways to fixed the issue.</font></font></font></font></p>
            <p><font size="+1"><font size="+1"><font size="+1"><font
                      size="+1">1 expand allarch/noarch packages with
                      multilib. So if add </font></font></font></font><font
                size="+1"><font size="+1"><font size="+1"><font
                      size="+1"><font size="+1"><font size="+1">ca-certificates
                          to image, </font></font>lib32-</font></font></font></font><font
                size="+1"><font size="+1">ca-certificates will be<br>
                     installed to 32bits rootfs. And then also the
                  dependency lib32-openssl is installed. That is what we
                  expected.<br>
                </font></font></p>
            <p><font size="+1"><font size="+1">2 expand DEPENDS/RDEPENDS
                  of </font></font><font size="+1"><font size="+1"><font
                    size="+1"><font size="+1">allarch/noarch packages
                      with a prefix 'noarch-' when multilib is enabled.
                      So</font> then<br>
                       </font></font></font><font size="+1"><font
                  size="+1"><font size="+1"><font size="+1"><font
                        size="+1"><font size="+1"><font size="+1"><font
                              size="+1"><font size="+1"><font size="+1">ca-certificates
                                  requires 'noarch-openssl'. And make
                                  both lib32-openssl and openssl
                                  provides </font></font></font></font></font></font></font></font></font></font><font
                size="+1"><font size="+1"><font size="+1"><font
                      size="+1"><font size="+1"><font size="+1"><font
                            size="+1"><font size="+1"><font size="+1"><font
                                  size="+1">'noarch-openssl'.<br>
                                     When do_rootfs, there is only one
                                  rpm repo 'oe-rootfs-repo' now. We will
                                  create repos with different priorities<br>
                                     according to different
                                  archs/subdirectories. For 32 bits
                                  image, make 32 bits rpm repo has 
                                  higher priority, so </font></font></font></font></font></font></font></font></font></font><font
                size="+1"><font size="+1"><font size="+1"><font
                      size="+1"><font size="+1"><font size="+1"><font
                            size="+1"><font size="+1"><font size="+1"><font
                                  size="+1">lib32-openssl<br>
                                     will be installed to 32 bits rootfs
                                  rather than 64bits.</font></font></font></font></font></font></font></font></font></font></p>
            <p><font size="+1"><font size="+1"><font size="+1"><font
                      size="+1"><font size="+1"><font size="+1"><font
                            size="+1"><font size="+1"><font size="+1"><font
                                  size="+1">I know these 2 ways are not
                                  perfect, but only possible ways I have
                                  in mind to solve the problem.</font></font></font></font></font></font></font></font></font></font><font
                size="+1"><br>
              </font></p>
            <p><font size="+1">Any comment or suggestion is greatly
                appreciated. Thanks a lot.</font></p>
            <pre class="m_1934409344669207458moz-signature" cols="72">-- 
Regards,
Neil | Kai Kang</pre>
          </div>
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
Regards,
Neil | Kai Kang</pre>
  </body>
</html>

--------------85ABDB261F0595FD32F5A0F2--
