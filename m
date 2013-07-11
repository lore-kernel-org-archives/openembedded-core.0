Return-Path: <niqingliang2003@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 652FC6A45E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 07:58:09 +0000 (UTC)
Received: by mail-pd0-f173.google.com with SMTP id v14so7230603pde.32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 00:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
	:references:mime-version:content-transfer-encoding:content-type;
	bh=xQpeNrIBgc6J8GB9z8b9FHMO3AgwbS9xCypf96IXy5Q=;
	b=cOzeJStFDNRqLd0Wpp9ZyUa4s/r9m1i5+mCjDSOt/ZLkIBep9C0SkoBJA3LzBGcBTR
	kpP+ppZNZ5SfJLWEk9quNiRJoGzzNN+4Sn5LYkdSK7Y1rnfTuDUDXjGcxNB/rNpWShhZ
	lq+VTPsApD3VaBtfMABJodVkkdl9KJx/+p50rdYdAACE9I0G3mAGz9oHogXu2s46MsLF
	YV/A/+5q4xcmYE5XnWDbzLYiWfAikVVlGqtR9TpSn4Db1y5sTRtu5OdPEJnHPfxkaa3z
	vn/zoyf9o6POFm2jTYMbglaZuMAULzK9BAh37h7btaBsQVUbqCaETTPDpgq3+9h0jI4G
	hRKw==
X-Received: by 10.68.131.168 with SMTP id on8mr35296540pbb.97.1373529489708;
	Thu, 11 Jul 2013 00:58:09 -0700 (PDT)
Received: from yiqingliang-pc.localnet ([117.89.77.62])
	by mx.google.com with ESMTPSA id iv4sm38330804pbc.9.2013.07.11.00.58.06
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 11 Jul 2013 00:58:08 -0700 (PDT)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 11 Jul 2013 15:53:27 +0800
Message-ID: <4040551.kht3okHjSo@yiqingliang-pc>
User-Agent: KMail/4.10.4 (Linux/3.9.8-1-ARCH; KDE/4.10.4; x86_64; ; )
In-Reply-To: <20130711073030.GF3288@jama>
References: <2457726.ZAE80f4V8O@yiqingliang-pc>
	<4753381.i1zt9jKOiD@yiqingliang-pc> <20130711073030.GF3288@jama>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: boost 1.54 compile fail
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
X-List-Received-Date: Thu, 11 Jul 2013 07:58:09 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, July 11, 2013 09:30:30 AM Martin Jansa wrote:
> On Thu, Jul 11, 2013 at 09:54:28AM +0800, Yi Qingliang wrote:
> > maybe it is the gcc's fault (recently it is updated to 4.8.x in poky)
> > 
> > I can found uintptr_t in cstdint, but it is wrapped by a c99 related
> > macro.
> 
> See
> http://lists.openembedded.org/pipermail/openembedded-devel/2013-July/091331.
> html https://lists.yoctoproject.org/pipermail/yocto/2013-July/017159.html
> threads

thanks! I have checked that, but the answer is not obvious,
what is the reason? gcc ? eglibc ? or boost ?

> 
> > On Wednesday, July 10, 2013 04:21:02 PM Yi Qingliang wrote:
> > > Hello!
> > > 
> > > after update poky to latest git version, I got failure when compiling
> > > boost:
> > > 
> > > the main error is: (indeed, and too many warning!)
> > > 
> > > | ./boost/atomic/atomic.hpp:202:16: error: 'uintptr_t' was not declared
> > > | in
> > > 
> > > this scope
> > > 
> > > |  typedef atomic<uintptr_t> atomic_uintptr_t;
> > > |  
> > > |                 ^
> > > | 
> > > | ./boost/atomic/atomic.hpp:202:25: error: template argument 1 is
> > > | invalid
> > > | 
> > > |  typedef atomic<uintptr_t> atomic_uintptr_t;
> > > |  
> > > |                          ^
> > > | 
> > > | ./boost/atomic/atomic.hpp:202:43: error: invalid type in declaration
> > > | before
> > > 
> > > ';' token
> > > 
> > > |  typedef atomic<uintptr_t> atomic_uintptr_t;
> > > |  
> > > |                                            ^
> > > | 
> > > | In file included from ./boost/system/system_error.hpp:14:0,
> > > | 
> > > |                  from ./boost/thread/exceptions.hpp:22,
> > > |                  from ./boost/thread/pthread/thread_data.hpp:10,
> > > |                  from ./boost/thread/thread_only.hpp:17,
> > > |                  from libs/thread/src/pthread/thread.cpp:11:
-- 
Nanjing Jilong
Yi Qingliang
niqingliang2003@gmail.com

