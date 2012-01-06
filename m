Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RjEAY-0005zo-H6
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 19:05:35 +0100
Received: from mail-iy0-f180.google.com ([209.85.210.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 06 Jan 2012 09:58:08 -0800
Received: by iazz13 with SMTP id z13so3086113iaz.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2012 09:58:08 -0800 (PST)
Received: by 10.42.73.138 with SMTP id s10mr6586819icj.38.1325872688105;
	Fri, 06 Jan 2012 09:58:08 -0800 (PST)
Received: from [127.0.0.1] (masterfoo.zenlinux.com. [207.192.74.254])
	by mx.google.com with ESMTPS id 5sm38780968ibe.8.2012.01.06.09.58.05
	(version=SSLv3 cipher=OTHER); Fri, 06 Jan 2012 09:58:07 -0800 (PST)
Message-ID: <4F07361F.8000406@intel.com>
Date: Fri, 06 Jan 2012 09:57:51 -0800
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1325744640.git.sgw@linux.intel.com>
	<04bb0f6bbd41ec9c2234df49130dba2346d9a3bf.1325744640.git.sgw@linux.intel.com>
	<lyboqh86qb.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <lyboqh86qb.fsf@ensc-virt.intern.sigma-chemnitz.de>
Subject: Re: [CONSOLIDATED PULL 04/28] ncurses: move libraries to base_libdir
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Jan 2012 18:05:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/06/2012 02:29 AM, Enrico Scholz wrote:
> Saul Wold<sgw-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>  writes:
>
>> -		f=${D}${libdir}/$i.so
>> +                f=${D}${base_libdir}/$i.so
>
> this breaks builds because 'ld' does not search ${base_libdir}:
>
> | gcc -shared ... -ltermcap
> | /usr/bin/ld: cannot find -ltermcap
> | ERROR: Task 216 (virtual:native:.../readline/readline_6.2.bb, do_install) failed with exit code '1'
> | ERROR: 'virtual:native:.../readline/readline_6.2.bb' failed

Which is why I added:

# tic from the -native build cannot run without setting this explicitly
BUILD_LDFLAGS_virtclass-native += "-Wl,-rpath,${base_libdir}"

to ncurses.inc

Is this not working?

I build-tested this with our -minimal and -sato images, and readline is 
built as a part of this. Not sure how I could have missed this, unless 
some host contamination was creeping in.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


