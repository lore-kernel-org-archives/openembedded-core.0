Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 55EF077A0C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 22:41:39 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3w0F1c5n9Gz1qt07;
	Sat,  8 Apr 2017 00:41:38 +0200 (CEST)
Received: from localhost (dynscan01.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3w0F1Z6D1jz3hjl7;
	Sat,  8 Apr 2017 00:41:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan01.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id eAAlipD1EIuF; Sat,  8 Apr 2017 00:41:37 +0200 (CEST)
X-Auth-Info: z06lXCETwnCc/9Y1ZQVztAqWVxe2KwsPTk8IZmzfbH4=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Sat,  8 Apr 2017 00:41:37 +0200 (CEST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20170407215501.31916-1-marex@denx.de>
	<1491604308.17200.106.camel@linuxfoundation.org>
From: Marek Vasut <marex@denx.de>
Message-ID: <57e03509-228e-9b3a-890d-e45d868f4c05@denx.de>
Date: Sat, 8 Apr 2017 00:41:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <1491604308.17200.106.camel@linuxfoundation.org>
Subject: Re: [PATCH] lsb: Remove bashisms from the rc.d functions
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
X-List-Received-Date: Fri, 07 Apr 2017 22:41:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 04/08/2017 12:31 AM, Richard Purdie wrote:
> On Fri, 2017-04-07 at 23:55 +0200, Marek Vasut wrote:
>> This bashism prevents functions from working on systems without bash,
>> ie. on systems with busybox shell or debian dash. Replace them with
>> bourne-compatible command instead.
> 
> Note that you'd code adds in a couple of forks for code which currently
> doesn't need separate process execution. Its therefore not a clear cut
> win. Is there no way to do it without the forks in dash?

Well do you know of any bourne-compatible way ? I'll be happy to learn
something new ...

> Cheers,
> 
> Richard
> 
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Ross Burton <ross.burton@intel.com>
>> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>  .../0002-rc.d-Remove-bashism-from-functions.patch  | 48
>> ++++++++++++++++++++++
>>  meta/recipes-extended/lsb/lsbinitscripts_9.68.bb   |  1 +
>>  2 files changed, 49 insertions(+)
>>  create mode 100644 meta/recipes-extended/lsb/lsbinitscripts/0002-
>> rc.d-Remove-bashism-from-functions.patch
>>
>> diff --git a/meta/recipes-extended/lsb/lsbinitscripts/0002-rc.d-
>> Remove-bashism-from-functions.patch b/meta/recipes-
>> extended/lsb/lsbinitscripts/0002-rc.d-Remove-bashism-from-
>> functions.patch
>> new file mode 100644
>> index 0000000000..44eed1cc18
>> --- /dev/null
>> +++ b/meta/recipes-extended/lsb/lsbinitscripts/0002-rc.d-Remove-
>> bashism-from-functions.patch
>> @@ -0,0 +1,48 @@
>> +From b7601dcd4663a9cb936a6d2d224665bea69fcc50 Mon Sep 17 00:00:00
>> 2001
>> +From: Marek Vasut <marex@denx.de>
>> +Date: Thu, 6 Apr 2017 19:15:56 +0200
>> +Subject: [PATCH] rc.d: Remove bashism from functions
>> +
>> +This bashism prevents functions from working on systems without
>> bash,
>> +ie. on systems with busybox shell or debian dash. Replace them with
>> +bourne-compatible command instead.
>> +
>> +Signed-off-by: Marek Vasut <marex@denx.de>
>> +---
>> + rc.d/init.d/functions | 9 ++-------
>> + 1 file changed, 2 insertions(+), 7 deletions(-)
>> +
>> +diff --git a/rc.d/init.d/functions b/rc.d/init.d/functions
>> +index 746b37d..3ba21ef 100644
>> +--- a/rc.d/init.d/functions
>> ++++ b/rc.d/init.d/functions
>> +@@ -115,15 +115,11 @@ __kill_pids_term_kill_checkpids() {
>> +     local pid=
>> +     local pids=$*
>> +     local remaining=
>> +-    local stat=
>> +     local stime=
>> + 
>> +     for pid in $pids ; do
>> +         [ ! -e  "/proc/$pid" ] && continue
>> +-        read -r line < "/proc/$pid/stat" 2> /dev/null
>> +-
>> +-        stat=($line)
>> +-        stime=${stat[21]}
>> ++        stime=`cut -d " " -f 22 < /proc/self/stat`
>> + 
>> +         [ -n "$stime" ] && [ "$base_stime" -lt "$stime" ] &&
>> continue
>> +         remaining+="$pid "
>> +@@ -139,8 +135,7 @@ __kill_pids_term_kill() {
>> +     local try=0
>> +     local delay=3;
>> +     local pid=
>> +-    local stat=($(< /proc/self/stat))
>> +-    local base_stime=${stat[21]}
>> ++    local base_stime=`cut -d " " -f 22 < /proc/self/stat`
>> + 
>> +     if [ "$1" = "-d" ]; then
>> +         delay=$2
>> +-- 
>> +2.11.0
>> +
>> diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.68.bb
>> b/meta/recipes-extended/lsb/lsbinitscripts_9.68.bb
>> index 0c08fffcef..9ba0e01776 100644
>> --- a/meta/recipes-extended/lsb/lsbinitscripts_9.68.bb
>> +++ b/meta/recipes-extended/lsb/lsbinitscripts_9.68.bb
>> @@ -11,6 +11,7 @@ S="${WORKDIR}/initscripts-${PV}"
>>  SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/inits
>> cripts-${PV}.tar.bz2/6a51a5af38e01445f53989ed0727c3e1/initscripts-
>> ${PV}.tar.bz2 \
>>             file://functions.patch \
>>             file://0001-functions-avoid-exit-1-which-causes-init-
>> scripts-to-.patch \
>> +	   file://0002-rc.d-Remove-bashism-from-functions.patch \
>>            " 
>>  
>>  SRC_URI[md5sum] = "6a51a5af38e01445f53989ed0727c3e1"


-- 
Best regards,
Marek Vasut

