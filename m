Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 913F960272
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2018 02:28:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w432SSqT009304
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 May 2018 19:28:43 -0700
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 2 May 2018 19:28:17 -0700
To: <openembedded-core@lists.openembedded.org>
References: <CALXw4G79a_yJvV1GrMxVEiVRs0b_RU324yGDy+wZwAV-T4Wj_w@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <ab59e9e2-4235-32b6-5f7a-abc3c34a6f91@windriver.com>
Date: Thu, 3 May 2018 10:29:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CALXw4G79a_yJvV1GrMxVEiVRs0b_RU324yGDy+wZwAV-T4Wj_w@mail.gmail.com>
X-Originating-IP: [128.224.162.218]
Subject: Re: Busybox post install
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
X-List-Received-Date: Thu, 03 May 2018 02:28:53 -0000
Content-Type: multipart/alternative;
	boundary="------------75F3F46EBD506D313D23E263"

--------------75F3F46EBD506D313D23E263
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/03/2018 09:20 AM, Michael Gloff wrote:
> I am seeing with the latest in Sumo/Master that the busybox post 
> install is failing to create all of the applet symlinks if there is 
> already a package installed from another provider during do_rootfs. 
> This can be seen, for example, when enabling lsattr applet and having 
> e2fsprogs installed into an image.
>
> The error is:
> update-alternatives: Error: not linking 
> /home/developer/oe-test/build_master/tmp/work/somimx6-emac-linux-gnueabi/emac-image/1.0-r0/rootfs/usr/bin/lsattr 
> to /usr/bin/busybox.nosuid since 
> /home/developer/oe-test/build_master/tmp/work/somimx6-emac-linux-gnueabi/emac-image/1.0-r0/rootfs/usr/bin/lsattr 
> exists and is not a link
>
> In Rocko and before, this error is present, but the script continues 
> creating the rest of the symlinks and exits with success.
>
> Does anyone have any idea why the failure is now causing the script to 
> stop executing?
>
> Michael Gloff
> mgloff@emacinc.com <mailto:mgloff@emacinc.com>
>
>

e2fsprogs deals with 'chattr', you can do the similar for 'lsattr'.
meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb:    mv 
${D}${bindir}/chattr ${D}${base_bindir}/chattr.e2fsprogs
meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb:ALTERNATIVE_${PN} = 
"chattr"
meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb:ALTERNATIVE_LINK_NAME[chattr] 
= "${base_bindir}/chattr"
meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb:ALTERNATIVE_TARGET[chattr] 
= "${base_bindir}/chattr.e2fsprogs"

For your question, maybe update-alternatives has been upgraded to view 
such conflict as error? I didn't check.

Best Regards,
Chen Qi

--------------75F3F46EBD506D313D23E263
Content-Type: text/html; charset="windows-1252"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 05/03/2018 09:20 AM, Michael Gloff
      wrote:<br>
    </div>
    <blockquote
cite="mid:CALXw4G79a_yJvV1GrMxVEiVRs0b_RU324yGDy+wZwAV-T4Wj_w@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <div dir="ltr">
        <div>
          <div>
            <div>
              <div>
                <div>I am seeing with the latest in Sumo/Master that the
                  busybox post install is failing to create all of the
                  applet symlinks if there is already a package
                  installed from another provider during do_rootfs. This
                  can be seen, for example, when enabling lsattr applet
                  and having e2fsprogs installed into an image.<br>
                  <br>
                </div>
                The error is:<br>
                update-alternatives: Error: not linking
                /home/developer/oe-test/build_<wbr>master/tmp/work/somimx6-emac-l<wbr>inux-gnueabi/emac-image/1.0-r0<wbr>/rootfs/usr/bin/lsattr
                to /usr/bin/busybox.nosuid since
                /home/developer/oe-test/build_<wbr>master/tmp/work/somimx6-emac-l<wbr>inux-gnueabi/emac-image/1.0-r0<wbr>/rootfs/usr/bin/lsattr
                exists and is not a link<br>
                <br>
              </div>
              In Rocko and before, this error is present, but the script
              continues creating the rest of the symlinks and exits with
              success.<br>
              <br>
            </div>
            Does anyone have any idea why the failure is now causing the
            script to stop executing?<span
              class="gmail-m_9104236682904143277HOEnZb"><font
                color="#888888"><br>
                <br>
              </font></span></div>
          <span class="gmail-m_9104236682904143277HOEnZb"><font
              color="#888888">Michael Gloff<br>
            </font></span></div>
        <span class="gmail-m_9104236682904143277HOEnZb"><font
            color="#888888"><a moz-do-not-send="true"
              href="mailto:mgloff@emacinc.com" target="_blank">mgloff@emacinc.com</a></font></span><br>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
    e2fsprogs deals with 'chattr', you can do the similar for 'lsattr'.<br>
    meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb:    mv
    ${D}${bindir}/chattr ${D}${base_bindir}/chattr.e2fsprogs<br>
meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb:ALTERNATIVE_${PN} =
    "chattr"<br>
meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb:ALTERNATIVE_LINK_NAME[chattr]
    = "${base_bindir}/chattr"<br>
meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb:ALTERNATIVE_TARGET[chattr]
    = "${base_bindir}/chattr.e2fsprogs"<br>
    <br>
    For your question, maybe update-alternatives has been upgraded to
    view such conflict as error? I didn't check.<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
  </body>
</html>

--------------75F3F46EBD506D313D23E263--
