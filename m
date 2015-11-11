Return-Path: <aws.ismail@gmail.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8273D771AF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 22:35:42 +0000 (UTC)
Received: by obbnk6 with SMTP id nk6so33205884obb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 14:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ZpU3aTuBUlaRBODlScwIoBu60rSr3+YVaDTqi4MG99Q=;
	b=o9zabmgeKVQrHGcUgLrrOtFNjfNtIodqdG/pYfsL6YyX+V3OeTI6jVLH9k3FyzT0oc
	uX/i35x2g0qQOCWgQ+27AMOI8HzcAFMBah+DhLahWwl/p66Qq7hLc57PQq5BVT1x/uOq
	xLBx54WL0pC0xbjwVhBfNobetcqZ/Q1yUjJWCJcrkGS9CmrONHc0y8vf7Rq8Qzp0Ua09
	PWUJnyQCb4InWpmW9HvpsNyzUQwMCmmmKjFqykQokJPAs4xOsypOfPzDS04n7V4HyBmO
	sPYl9rMgKPfDWv+bNIJZSzGsIQQCPzI4GpNZZoKuMKLWg8zfoiHsfavmrCB2z6d5VjJB
	Mrgw==
X-Received: by 10.182.129.138 with SMTP id nw10mr6817721obb.24.1447281342301; 
	Wed, 11 Nov 2015 14:35:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.41.39 with HTTP; Wed, 11 Nov 2015 14:35:22 -0800 (PST)
In-Reply-To: <563BB4A2.3020800@linux.intel.com>
References: <1446590054-31188-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
	<563BB4A2.3020800@linux.intel.com>
From: Aws Ismail <aws.ismail@gmail.com>
Date: Wed, 11 Nov 2015 17:35:22 -0500
Message-ID: <CAMHMu0MdEZMZF7bZ77tO897wy1yyS2a3hE0+3fi-hZqt2YZe_g@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: benoit.rapidel+yocto@exmachina.fr, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] terminal: Support old tmux version (<1.9) when querying height value
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
X-List-Received-Date: Wed, 11 Nov 2015 22:35:43 -0000
Content-Type: text/plain; charset=UTF-8

I have verified that the patch does not work. I am using tmux v1.8
with the latest jethro poky.

On Thu, Nov 5, 2015 at 2:57 PM, Leonardo Sandoval
<leonardo.sandoval.gonzalez@linux.intel.com> wrote:
> This patch did not solve the case when multiple panes are present. I will
> send a V2 patch.
>
>
>
> On 11/03/2015 04:34 PM, leonardo.sandoval.gonzalez@linux.intel.com wrote:
>>
>> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>>
>> Old tmux version (< 1.9) does not support nested formats on the -F
>> parameter, so
>> if nested format does not give any answer, do the query in two steps.
>>
>> Tested on tmux 1.6.
>>
>> Signed-off-by: Leonardo Sandoval
>> <leonardo.sandoval.gonzalez@linux.intel.com>
>> ---
>>   meta/lib/oe/terminal.py |   15 ++++++++++++++-
>>   1 file changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
>> index 52a8913..686b1ce 100644
>> --- a/meta/lib/oe/terminal.py
>> +++ b/meta/lib/oe/terminal.py
>> @@ -218,11 +218,24 @@ def spawn(name, sh_cmd, title=None, env=None,
>> d=None):
>>
>>   def check_tmux_pane_size(tmux):
>>       import subprocess as sub
>> +    size = 0
>>       try:
>>           p = sub.Popen('%s list-panes -F
>> "#{?pane_active,#{pane_height},}"' % tmux,
>>                   shell=True,stdout=sub.PIPE,stderr=sub.PIPE)
>>           out, err = p.communicate()
>> -        size = int(out.strip())
>> +        try:
>> +            size = int(out.strip())
>> +        except ValueError:
>> +            # Older tmux versions (< 1.9) does not support nested
>> formats,
>> +            # so try it in two steps
>> +            p = sub.Popen('%s list-panes -F "#{?pane_active,yes,no}"' %
>> tmux,
>> +                shell=True,stdout=sub.PIPE,stderr=sub.PIPE)
>> +            out, err = p.communicate()
>> +            if "yes" in out.strip():
>> +                p = sub.Popen('%s list-panes -F "#{pane_height}"' % tmux,
>> +                              shell=True,stdout=sub.PIPE,stderr=sub.PIPE)
>> +                out, err = p.communicate()
>> +                size = int(out.strip())
>>       except OSError as exc:
>>           import errno
>>           if exc.errno == errno.ENOENT:
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

