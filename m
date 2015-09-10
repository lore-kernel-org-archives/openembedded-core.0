Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 7BDED73232
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 16:07:58 +0000 (UTC)
Received: by padhy16 with SMTP id hy16so46936481pad.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 09:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=0E3AAYhluyqo7zOp+HmNp+Ki+HZH2kHiGRhYWilTwTI=;
	b=jNpSFsqoTweIow26LSw98dH0cWfuQCUC24rR524BtqFq3J6KX1I3xjpBLBjBlNixQo
	d4HQ4kaEa98M+qkeXxmW/BC1OtwWyTwJ9NGZ2exdZP6R9l4PiKD8RMUxzVU3DSVONix8
	uU/L0KBtGNNjYveF21qTDg0fj21uZOv61LacSUoARQ0u3PeLoi3tgI8M43+nN7TdiG6G
	JndlU8WIxk+TxdrzoTO1yLwnFT2hZBpPho9WHunhYiYiEoayiy0H+J+Uffv6n86VXJPt
	0VQL1F7rax2qrppmiiOu2j9JlY8Job+dTzu/GvHnQM7u3G+Ik883fKDPd7olcJ+eG3PP
	eWng==
X-Received: by 10.68.130.71 with SMTP id oc7mr11535667pbb.29.1441901278410;
	Thu, 10 Sep 2015 09:07:58 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:5888:bc0f:f0c6:30a3?
	([2601:202:4000:1239:5888:bc0f:f0c6:30a3])
	by smtp.googlemail.com with ESMTPSA id
	uy4sm12821436pbc.69.2015.09.10.09.07.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 Sep 2015 09:07:57 -0700 (PDT)
Message-ID: <55F1AADB.1050604@gmail.com>
Date: Thu, 10 Sep 2015 09:07:55 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>, 
	openembedded-core@lists.openembedded.org
References: <1441369348-32182-1-git-send-email-Martin.Jansa@gmail.com>
	<20150904122702.GB2457@jama>
In-Reply-To: <20150904122702.GB2457@jama>
Subject: Re: [RFC][dizzy][fido][master][PATCH 1/3] rootfs.py: Allow to override postinst-intercepts location
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
X-List-Received-Date: Thu, 10 Sep 2015 16:07:58 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

All 3 in master so backporting to Dizzy.

- armin

On 09/04/2015 05:27 AM, Martin Jansa wrote:
> On Fri, Sep 04, 2015 at 02:22:26PM +0200, Martin Jansa wrote:
>> * useful when we need to overlay/extend intercept scripts from oe-core
> 
> 2/3 and 3/3 could be a bit dangerous or controversial (main reason why
> this was sent as RFC), but this one is really useful for us to apply
> these fixes in advance (and without backporting them all to fido and
> dizzy) - so if you agree please merge 1/3 to master, fido and dizzy.
> 
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>  meta/lib/oe/rootfs.py | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
>> index c29843b..76950ec 100644
>> --- a/meta/lib/oe/rootfs.py
>> +++ b/meta/lib/oe/rootfs.py
>> @@ -164,6 +164,9 @@ class Rootfs(object):
>>          pre_process_cmds = self.d.getVar("ROOTFS_PREPROCESS_COMMAND", True)
>>          post_process_cmds = self.d.getVar("ROOTFS_POSTPROCESS_COMMAND", True)
>>  
>> +        postinst_intercepts_dir = self.d.getVar("POSTINST_INTERCEPTS_DIR", True)
>> +        if not postinst_intercepts_dir:
>> +            postinst_intercepts_dir = self.d.expand("${COREBASE}/scripts/postinst-intercepts")
>>          intercepts_dir = os.path.join(self.d.getVar('WORKDIR', True),
>>                                        "intercept_scripts")
>>  
>> @@ -173,8 +176,7 @@ class Rootfs(object):
>>  
>>          bb.utils.mkdirhier(self.deploy_dir_image)
>>  
>> -        shutil.copytree(self.d.expand("${COREBASE}/scripts/postinst-intercepts"),
>> -                        intercepts_dir)
>> +        shutil.copytree(postinst_intercepts_dir, intercepts_dir)
>>  
>>          shutil.copy(self.d.expand("${COREBASE}/meta/files/deploydir_readme.txt"),
>>                      self.deploy_dir_image +
>> -- 
>> 2.5.0
>>
> 
> 
> 

