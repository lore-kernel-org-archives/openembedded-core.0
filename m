Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 66A547D3CE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2019 01:41:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7L1fUNJ007097
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 20 Aug 2019 18:41:30 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 20 Aug 2019 18:41:30 -0700
To: Alexander Kanavin <alex.kanavin@gmail.com>, Ross Burton
	<ross.burton@intel.com>
References: <20190820090559.196193-1-kai.kang@windriver.com>
	<20190820090559.196193-2-kai.kang@windriver.com>
	<e37dbfa4-eea3-ba19-da18-337cb7ec8ec3@intel.com>
	<CANNYZj9sQJgBvh0q66R2Ah0d9uXVO45a+5Z68nZ_yygX1-v88A@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <f9a432f2-7f32-6dae-ef54-387574b8093c@windriver.com>
Date: Wed, 21 Aug 2019 09:41:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj9sQJgBvh0q66R2Ah0d9uXVO45a+5Z68nZ_yygX1-v88A@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] adwaita-icon-theme: workaround for do_populate_sysroot failure
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
X-List-Received-Date: Wed, 21 Aug 2019 01:41:32 -0000
Content-Type: multipart/alternative;
	boundary="------------4BC3C3FC1D6973B42DBF630B"
Content-Language: en-US

--------------4BC3C3FC1D6973B42DBF630B
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2019/8/21 上午3:19, Alexander Kanavin wrote:
> On Tue, 20 Aug 2019 at 20:42, Ross Burton <ross.burton@intel.com 
> <mailto:ross.burton@intel.com>> wrote:
>
>     > It fails to run task do_populate_sysroot of adwaita-icon-theme
>     rarely:
>     >
>     > | DEBUG: Executing shell function sysroot_stage_all
>     > | cpio: ./icons/Adwaita/16x16/legacy/_inst.21134_: Cannot stat:
>     No such
>     >    file or directory
>     >
>     > In script ${S}/install-sh, temporary files _inst.* are created
>     and will be
>     > removed by shell builtin command trap when the script exits:
>     >
>     >      # Make a couple of temp file names in the proper directory.
>     >      dsttmp=${dstdirslash}_inst.$$_
>     >      rmtmp=${dstdirslash}_rm.$$_
>     >
>     >      # Trap to clean up those temp files at exit.
>     >      trap 'ret=$?; rm -f "$dsttmp" "$rmtmp" && exit $ret' 0
>     >
>     > The temporary files should be deleted already after task
>     do_install. But
>     > somehow they are still exist until the gap between commands find and
>     > cpio in populate_sysroot function sysroot_stage_dir().
>
>     So does this only happen to adwaita-icon-theme?  Is it a bug in
>     install-sh, so impacts almost every automake-using package?  Or is
>     it a
>     bug in how adwaita-icon-theme is using install-sh?
>
>
> This might actually be caused by my glorious hack:
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Run-installation-commands-as-shell-jobs.patch?h=master-next
>
> There is a 'wait' after every '&', so not sure what goes wrong here.

Hi Alex,

Thanks. I'll revert this commit locally. And if it is the root cause, 
I'll try to figure out what's going on here.

Kai


>
> Alex
>

-- 
Kai Kang


--------------4BC3C3FC1D6973B42DBF630B
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 2019/8/21 上午3:19, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANNYZj9sQJgBvh0q66R2Ah0d9uXVO45a+5Z68nZ_yygX1-v88A@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">
          <div dir="ltr">On Tue, 20 Aug 2019 at 20:42, Ross Burton &lt;<a
              href="mailto:ross.burton@intel.com" moz-do-not-send="true">ross.burton@intel.com</a>&gt;
            wrote:<br>
          </div>
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">&gt;
              It fails to run task do_populate_sysroot of
              adwaita-icon-theme rarely:<br>
              &gt; <br>
              &gt; | DEBUG: Executing shell function sysroot_stage_all<br>
              &gt; | cpio: ./icons/Adwaita/16x16/legacy/_inst.21134_:
              Cannot stat: No such<br>
              &gt;    file or directory<br>
              &gt; <br>
              &gt; In script ${S}/install-sh, temporary files _inst.*
              are created and will be<br>
              &gt; removed by shell builtin command trap when the script
              exits:<br>
              &gt; <br>
              &gt;      # Make a couple of temp file names in the proper
              directory.<br>
              &gt;      dsttmp=${dstdirslash}_inst.$$_<br>
              &gt;      rmtmp=${dstdirslash}_rm.$$_<br>
              &gt; <br>
              &gt;      # Trap to clean up those temp files at exit.<br>
              &gt;      trap 'ret=$?; rm -f "$dsttmp" "$rmtmp"
              &amp;&amp; exit $ret' 0<br>
              &gt; <br>
              &gt; The temporary files should be deleted already after
              task do_install. But<br>
              &gt; somehow they are still exist until the gap between
              commands find and<br>
              &gt; cpio in populate_sysroot function
              sysroot_stage_dir().<br>
              <br>
              So does this only happen to adwaita-icon-theme?  Is it a
              bug in <br>
              install-sh, so impacts almost every automake-using
              package?  Or is it a <br>
              bug in how adwaita-icon-theme is using install-sh?<br>
            </blockquote>
            <div><br>
            </div>
            <div>This might actually be caused by my glorious hack:</div>
            <div><a
href="https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Run-installation-commands-as-shell-jobs.patch?h=master-next"
                moz-do-not-send="true">https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Run-installation-commands-as-shell-jobs.patch?h=master-next</a></div>
            <div><br>
            </div>
            <div>There is a 'wait' after every '&amp;', so not sure what
              goes wrong here.</div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>Hi Alex,</p>
    <p>Thanks. I'll revert this commit locally. And if it is the root
      cause, I'll try to figure out what's going on here.</p>
    <p>Kai<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CANNYZj9sQJgBvh0q66R2Ah0d9uXVO45a+5Z68nZ_yygX1-v88A@mail.gmail.com">
      <div dir="ltr">
        <div dir="ltr">
          <div class="gmail_quote">
            <div><br>
            </div>
            <div>Alex </div>
          </div>
        </div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Kai Kang</pre>
  </body>
</html>

--------------4BC3C3FC1D6973B42DBF630B--
