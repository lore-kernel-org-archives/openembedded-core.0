Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C1F2160125
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 17:41:57 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 05 Nov 2015 09:41:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,248,1444719600"; d="scan'208";a="843446084"
Received: from lsandov1-mobl-linux.zpn.intel.com (HELO [10.219.5.145])
	([10.219.5.145])
	by orsmga002.jf.intel.com with ESMTP; 05 Nov 2015 09:41:55 -0800
Message-ID: <563B9576.40202@linux.intel.com>
Date: Thu, 05 Nov 2015 11:44:22 -0600
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Dan McGregor <danismostlikely@gmail.com>
References: <1446590054-31188-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
	<CACS+7ZSrrrmyc3hAUU6RJUSEpPvoBeQOLyFmjadJSqgJjoyVJg@mail.gmail.com>
In-Reply-To: <CACS+7ZSrrrmyc3hAUU6RJUSEpPvoBeQOLyFmjadJSqgJjoyVJg@mail.gmail.com>
Cc: benoit.rapidel+yocto@exmachina.fr,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 05 Nov 2015 17:42:00 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/03/2015 05:58 PM, Dan McGregor wrote:
> On 3 November 2015 at 16:34,
> <leonardo.sandoval.gonzalez@linux.intel.com> wrote:
>> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>>
>> Old tmux version (< 1.9) does not support nested formats on the -F parameter, so
>> if nested format does not give any answer, do the query in two steps.
>>
>> Tested on tmux 1.6.
>
> Yeah, I noticed this shortly after I submitted the fix for 1.9 but
> didn't think much of it. What system are you using that has tmux 1.6?
>

debian wheezy.

Benoit, can you report the issues you are seeing on tmux1.9 and the tmux 
output from the -F commands?

Seems than when n-panes are open, we get n outputs so clearly calling 
int() is not enough, so current solution just works when n=1


>>
>> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>> ---
>>   meta/lib/oe/terminal.py |   15 ++++++++++++++-
>>   1 file changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
>> index 52a8913..686b1ce 100644
>> --- a/meta/lib/oe/terminal.py
>> +++ b/meta/lib/oe/terminal.py
>> @@ -218,11 +218,24 @@ def spawn(name, sh_cmd, title=None, env=None, d=None):
>>
>>   def check_tmux_pane_size(tmux):
>>       import subprocess as sub
>> +    size = 0
>>       try:
>>           p = sub.Popen('%s list-panes -F "#{?pane_active,#{pane_height},}"' % tmux,
>>                   shell=True,stdout=sub.PIPE,stderr=sub.PIPE)
>>           out, err = p.communicate()
>> -        size = int(out.strip())
>> +        try:
>> +            size = int(out.strip())
>> +        except ValueError:
>> +            # Older tmux versions (< 1.9) does not support nested formats,
>> +            # so try it in two steps
>> +            p = sub.Popen('%s list-panes -F "#{?pane_active,yes,no}"' % tmux,
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
>> --
>> 1.7.10.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

