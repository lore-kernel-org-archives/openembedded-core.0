Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1Tea7u-0003Ec-Uy
	for openembedded-core@lists.openembedded.org;
	Sat, 01 Dec 2012 00:36:11 +0100
Received: from mail-pa0-f69.google.com ([209.85.220.69])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 30 Nov 2012 15:21:51 -0800
Received: by mail-pa0-f69.google.com with SMTP id rl6so1305237pac.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2012 15:21:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=wg4lBT5HoRoXIkQXTzuN+APWUUjZUaMjooGKCCDgpKs=;
	b=P41cqdXFxg3MX70+I8trVwCQWiSQa1dXn3gZag8bkMt7VC1lHKgG0t9Z6h4UDbOM5Y
	nxF9z/JbEDDvq4jKe+cBp7Qqm1+62q3SwHpXJ0WStl/PmgjiDri7gOsGQ3tuXDLNwyWT
	Yd257swO570FUv++OPkhXaQtwUsulDzDbXTuCGo9lAfM83L1vH0ptluLvVl923ELlEn+
	qRsFmiTiJQujIv+7YlDRAsv7fdTLXKrw/4e22VzKAJ7ZiLbUyOtVNVdovHgH1rmvnl1d
	f+VePPnNzsPO0UF05BJXUZAUrGoXWMVz01H2VgcvIg+gEh76FIzaP5d4la5+MSACPLDY
	tP8w==
Received: by 10.68.241.231 with SMTP id wl7mr9388302pbc.164.1354317710655;
	Fri, 30 Nov 2012 15:21:50 -0800 (PST)
Received: by 10.68.241.231 with SMTP id wl7mr9388275pbc.164.1354317710463;
	Fri, 30 Nov 2012 15:21:50 -0800 (PST)
Received: from [192.168.88.206] ([199.223.125.134])
	by mx.google.com with ESMTPS id wf8sm3713272pbc.65.2012.11.30.15.21.47
	(version=SSLv3 cipher=OTHER); Fri, 30 Nov 2012 15:21:48 -0800 (PST)
Message-ID: <50B93F8A.6060001@intel.com>
Date: Fri, 30 Nov 2012 15:21:46 -0800
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <3450> <1354274968-7181-1-git-send-email-yanjun.zhu@windriver.com>
	<50B900D9.6000403@linux.intel.com>
In-Reply-To: <50B900D9.6000403@linux.intel.com>
X-Gm-Message-State: ALoCoQlOt7RX9hEL6M9GW1bL8Ukfx1pD9OY3SjZKgTXBHuEVcCiiqQHf+JEhGgNBBzPYTglsTVy0waJEQMbeFflSjHvX3YwMQujihOtyA9fDKEha/bN9La4RC0PUHiW4nu4ucShJjB89verwwTW8du+TcJMG+VUrXqmMyMyxYfuEcz+SM65P8SyqGyIO46ASPjQ6LpTVr45a
Subject: Re: [PATCH 1/1] Python: Fix for CVE-2012-2135 (for denzil)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Nov 2012 23:36:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/30/2012 10:54 AM, Saul Wold wrote:
> On 11/30/2012 03:29 AM, yanjun.zhu wrote:
>> From: "yanjun.zhu" <yanjun.zhu@windriver.com>
>>
>> Reference:http://bugs.python.org/issue14579
>>
>> The utf-16 decoder in Python 3.1 through 3.3 does not update the
>> aligned_end variable after calling the unicode_decode_call_errorhandler
>> function, which allows remote attackers to obtain sensitive information
>> (process memory) or cause a denial of service (memory corruption and
>> crash)
>> via unspecified vectors.
>>
>> http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-2135
>>
>> [YOCTO #3450]
>>
> Is this for Denzil or is there a 2.7.3 patch for this CVE?  Both Danny
> (1.3) and master are using Python 2.7.3, which does not seem to have
> this CVE fixed yet.

The CVE link above states that the vulnerability exists only in python 
v3.1 - 3.3. That would suggest it would not apply to denzil at all.

I'm thrilled to see more security fixes rolling in, but I'm not sure 
what's going on if they do not apply to the versions of upstream 
software we're shipping.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


