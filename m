Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4D8D273216
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 03:20:20 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id c131so939536wmh.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 20:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aMtrHgoHJnF6EcG0KP1aI3OwJTP6pzO14bRfaNp/5QA=;
	b=ZCkEZKbrdHLspmOkfMrua2dfQpGU4bcGmMDzbFTohupqkzajXlypL0VUXGNAgPB1l2
	59lleTou7MGLgIvoIqntgq+LDzR0zuvm2h5l/CaNDhHqGvqtrnSnLfklHQWcFxpgFupK
	aEI5PO2+Bug0FJbGMoziJLXXfKpXpwZ/yvHWO77Qx0OAbHfshicS/5wpfmbjJBI8xLRj
	ypwwscYjYSqSt5s9LcmkRrhzW1lfVWZZOkiaet6LSnBYGOyDoaocAsk3It91fpvPkzEZ
	FLIU0WfS83Ph5AXBOZg1T7N0FFKDQOK7h9CZvStv/DP4PoCd0GRdKeIYlYdpbaOYhJDp
	wmMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aMtrHgoHJnF6EcG0KP1aI3OwJTP6pzO14bRfaNp/5QA=;
	b=KebME68B9m6LHaKcXIHaXtT1uu+t711ZYMxFQiuPRM25xLXfWLr6kVwC7lHXeaAPN+
	LkQo8BhMQwwhvWIqjHtyBW27tjXef7xiY0TN93MDHBjUIfDJkNms1jJHc48TWXeaQfyS
	OEh8xcgdPohK6Am0BAq3mdj5BxVxQMNPKStrLx22LirX7NpCtFme7AWlr0v5q7gWbIVZ
	n5La/Z4UKMTt7qPR/a23qcccj9EgrZE3TBnZ01wcN3gL/RSKjD6iugzclTDqrx3pLr8x
	YzwSbxoBFrs2BjX84DpDazMEok0mtv7L2xUYI7yZiW1pwdudsMBYCe45VpTSDd7mdorV
	zrrQ==
X-Gm-Message-State: AE9vXwMsxbmmBMINn80sKhwVjdNzNb0SzhpbDozSnzEbORBfZml0pVp7tbeTASir9BFrLnVfy7ICnxo8ccPe8g==
X-Received: by 10.28.211.129 with SMTP id k123mr2631287wmg.116.1473736821347; 
	Mon, 12 Sep 2016 20:20:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.190.233 with HTTP; Mon, 12 Sep 2016 20:20:20 -0700 (PDT)
In-Reply-To: <aeae8af5-a8c6-f894-d6e5-c78beb993a7f@windriver.com>
References: <1473721254-9610-1-git-send-email-armccurdy@gmail.com>
	<aeae8af5-a8c6-f894-d6e5-c78beb993a7f@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 12 Sep 2016 20:20:20 -0700
Message-ID: <CAJ86T=UYPX249rS7qT3Q-pdcpUb=Y9UU5NzVGy8NFS=AaC__vQ@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rootfs.py: support absolute paths in IMAGE_DEVICE_TABLES
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
X-List-Received-Date: Tue, 13 Sep 2016 03:20:22 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 12, 2016 at 5:17 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 9/12/16 6:00 PM, Andre McCurdy wrote:
>> Paths relative to BBPATH are fine if device table files are always
>> static and contained somewhere within a meta layer. However if device
>> tables are created dynamically, they will be located somewhere within
>> ${TMPDIR} and most conveniently referenced via an absolute path.
>>
>> The legacy IMAGE_DEVICE_TABLE variable supported an absolute path,
>> therefore make IMAGE_DEVICE_TABLES support absolute paths too, to
>> avoid users who need dynamic device table files being dependent on
>> the legacy variable.
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  meta/lib/oe/rootfs.py | 9 ++++++---
>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
>> index a348b97..32cce64 100644
>> --- a/meta/lib/oe/rootfs.py
>> +++ b/meta/lib/oe/rootfs.py
>> @@ -352,8 +352,8 @@ class Rootfs(object, metaclass=ABCMeta):
>>      """
>>      Create devfs:
>>      * IMAGE_DEVICE_TABLE is the old name to an absolute path to a device table file
>> -    * IMAGE_DEVICE_TABLES is a new name for a file, or list of files, seached
>> -      for in the BBPATH
>> +    * IMAGE_DEVICE_TABLES is the new name for a file, or list of files, which may be
>> +      either absolute paths or paths relative to BBPATH.
>>      If neither are specified then the default name of files/device_table-minimal.txt
>>      is searched for in the BBPATH (same as the old version.)
>>      """
>> @@ -367,7 +367,10 @@ class Rootfs(object, metaclass=ABCMeta):
>>              if devtables is None:
>>                  devtables = 'files/device_table-minimal.txt'
>>              for devtable in devtables.split():
>> -                devtable_list.append("%s" % bb.utils.which(self.d.getVar('BBPATH', True), devtable))
>> +                if os.path.isabs(devtable):
>> +                    devtable_list.append(devtable)
>> +                else:
>> +                    devtable_list.append("%s" % bb.utils.which(self.d.getVar('BBPATH', True), devtable))
>
> I'm wondering if maybe this is a bug in "bb.utils.which", I thought it would
> return back -- in the case of an absolute path -- if the thing existed or not,
> otherwise would search the BBPATH.  (I'm using the command line version of
> 'which' as my behavioral thinking.)

Hmmm. The behaviour of "bb.utils.which" in the case of an absolute
path is actually to return back the absolute path - but only if the
file exists. If the file doesn't exist, you get back an empty string.
Unfortunately all the test cases I was trying were files which didn't
exist.

But perhaps the bigger issue is that result returned by
self._exec_shell_cmd() isn't checked, so it doesn't really matter
whether devtable_list ends up containing an empty string or an
absolute path to a file which doesn't exist. There's no error or
feedback to the user that something has gone wrong in either case.

Is it really intentional to silently skip over IMAGE_DEVICE_TABLES
entries which don't exist?

> If it is an issue, then it would need a fix in bitbake, and I believe the
> existing code should then work.
>
> (Asking about the behavior on the bitbake list might be worth while in this case.)
>
>>
>>          for devtable in devtable_list:
>>              self._exec_shell_cmd(["makedevs", "-r",
>>
>

