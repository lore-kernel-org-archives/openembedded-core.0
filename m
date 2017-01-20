Return-Path: <jason.wessel@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 250A6731C8
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 13:48:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v0KDmNgW024590
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 20 Jan 2017 05:48:23 -0800
Received: from [172.25.59.218] (172.25.59.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 20 Jan 2017 05:48:22 -0800
To: "Burton, Ross" <ross.burton@intel.com>, "Maxin B. John"
	<maxin.john@intel.com>
References: <20170119211441.126457-1-jason.wessel@windriver.com>
	<20170119211441.126457-2-jason.wessel@windriver.com>
	<f97e0ddf-dd9d-06d3-831c-fa47349a1e66@windriver.com>
	<20170120132920.GA8341@mbabyjoh-desk.ger.corp.intel.com>
	<CAJTo0LaFMD3cFHR2d_1W4pM3cy7ekhM21UpBRz_Ec+C4tYigQQ@mail.gmail.com>
From: Jason Wessel <jason.wessel@windriver.com>
Message-ID: <63d74901-4f7e-292f-8163-445006e226d2@windriver.com>
Date: Fri, 20 Jan 2017 07:48:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaFMD3cFHR2d_1W4pM3cy7ekhM21UpBRz_Ec+C4tYigQQ@mail.gmail.com>
Cc: OE-core <Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] Revert "kernel: Modify kernel modules installation path."
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
X-List-Received-Date: Fri, 20 Jan 2017 13:48:26 -0000
Content-Type: multipart/alternative;
	boundary="------------9232DA37A899F8FCDBD14F27"

--------------9232DA37A899F8FCDBD14F27
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/20/2017 07:30 AM, Burton, Ross wrote:
>
> On 20 January 2017 at 13:29, Maxin B. John <maxin.john@intel.com <mailto:maxin.john@intel.com>> wrote:
>
>     > The issue here is that in a multilib build the ${base_libdir} is resolving to /lib64 which completely breaks some tools that fully expect /lib/modules to be a fixed location regardless if the target is 32/64 or something else.
>     >
>
>     I would expect the kernel to be ok with this change if we provide the kernel command
>     line parameter: "firmware_class.path=${base_libdir}" or similar.
>
>

You are correct that this could work, but that is not a parameter I would expect to set in the default case.  It would only be something I used to execute a system rollback where I need firmware to get the device running again.


> I believe that using nonarch_base_libdir is the proper fix here, we need to understand why this didn't just work.
>
> Ross


When I had tried the search and replace I still ended up with the following problem, which is why I elected to just revert to what worked previously.


WARNING: linux-yocto-4.8.12+gitAUTOINC+3edb4de355_9bcb4ea3fa-r0 do_package: QA Issue: linux-yocto: Files/directories were installed but not shipped in any package:
   /lib64
   /lib/modules/4.8.17-yocto-standard/modules.builtin
   /lib64/firmware
   /lib64/firmware/cpia2
   /lib64/firmware/cpia2/stv0672_vp4.bin
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
linux-yocto: 5 installed and not shipped files. [installed-vs-shipped]

I am sure this problem can be corrected and debugged.


Cheers,

Jason.


--------------9232DA37A899F8FCDBD14F27
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 01/20/2017 07:30 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LaFMD3cFHR2d_1W4pM3cy7ekhM21UpBRz_Ec+C4tYigQQ@mail.gmail.com"
      type="cite">
      <meta http-equiv="Context-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 20 January 2017 at 13:29, Maxin B.
            John <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:maxin.john@intel.com" target="_blank">maxin.john@intel.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote"><span class="">&gt; The
                issue here is that in a multilib build the
                ${base_libdir} is resolving to /lib64 which completely
                breaks some tools that fully expect /lib/modules to be a
                fixed location regardless if the target is 32/64 or
                something else.<br>
                &gt;<br>
                <br>
              </span>I would expect the kernel to be ok with this change
              if we provide the kernel command<br>
              line parameter: "firmware_class.path=${base_<wbr>libdir}"
              or similar.<br>
            </blockquote>
          </div>
          <br>
        </div>
      </div>
    </blockquote>
    <br>
    You are correct that this could work, but that is not a parameter I
    would expect to set in the default case.  It would only be something
    I used to execute a system rollback where I need firmware to get the
    device running again. <br>
    <br>
    <br>
    <blockquote
cite="mid:CAJTo0LaFMD3cFHR2d_1W4pM3cy7ekhM21UpBRz_Ec+C4tYigQQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">I believe that using
          nonarch_base_libdir is the proper fix here, we need to
          understand why this didn't just work.</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>When I had tried the search and replace I still ended up with the
      following problem, which is why I elected to just revert to what
      worked previously. <br>
    </p>
    <p><br>
    </p>
    <p>WARNING: linux-yocto-4.8.12+gitAUTOINC+3edb4de355_9bcb4ea3fa-r0
      do_package: QA Issue: linux-yocto: Files/directories were
      installed but not shipped in any package:<br>
        /lib64<br>
        /lib/modules/4.8.17-yocto-standard/modules.builtin<br>
        /lib64/firmware<br>
        /lib64/firmware/cpia2<br>
        /lib64/firmware/cpia2/stv0672_vp4.bin<br>
      Please set FILES such that these items are packaged. Alternatively
      if they are unneeded, avoid installing them or delete them within
      do_install.<br>
      linux-yocto: 5 installed and not shipped files.
      [installed-vs-shipped]<br>
    </p>
    <p>I am sure this problem can be corrected and debugged. <br>
    </p>
    <p><br>
    </p>
    <p>Cheers,</p>
    <p>Jason.<br>
    </p>
  </body>
</html>

--------------9232DA37A899F8FCDBD14F27--
