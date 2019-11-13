Return-Path: <mark.hatle@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id 778986C0E5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:04:27 +0000 (UTC)
Received: from Marks-MacBook-Pro.local ([76.164.61.198]) (authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id xADF4Mwr013159
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NO); Wed, 13 Nov 2019 09:04:23 -0600
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	openembedded-core@lists.openembedded.org
References: <CAMRc=MfGPct57NYp9Nzozdjr6Va861-mXkyP335acPoThx+YCw@mail.gmail.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
Message-ID: <7378e406-2727-2449-5583-9c3f90e39c67@kernel.crashing.org>
Date: Wed, 13 Nov 2019 09:04:21 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <CAMRc=MfGPct57NYp9Nzozdjr6Va861-mXkyP335acPoThx+YCw@mail.gmail.com>
Subject: Re: pthreads should rdepend on libgcc
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
X-List-Received-Date: Wed, 13 Nov 2019 15:04:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 11/13/19 2:34 AM, Bartosz Golaszewski wrote:
> This isn't a patch as I'm not sure how to fix the right way it but it
> seems to my that every program that calls pthread_exit() indirectly
> rdepends on libgcc_s.so.1 being installed in the system (at least when
> using glibc).
> 
> This is because the implementation of __pthread_exit() in glibc calls
> pthread_cancel() which leads to pthread_cancel_init() being called in
> which said shared object is being loaded with dlopen(). When this
> fails, the program aborts with the following error message:
> 
>     libgcc_s.so.1 must be installed for pthread_cancel to work
>     Aborted

Fix for this would be to declare a runtime-dependency on libgcc_s.so.1 in the
glibc libpthread package.

--Mark

> A quick way of reproducing it is building a core-image-minimal (which
> by default doesn't contain libgcc) with the core python3 package and
> running the simple python HTTP server:
> 
>     python3 -m http.server 8000
> 
> Fetching any file will result in the above crash of the python process
> when the thread serving the file exits.
> 
> I'm not sure if the same issue is present in musl - the implementation
> of __pthread_exit() there is different.
> 
> Please advise on how to best approach this.
> 
> Thanks in advance,
> Bartosz Golaszewski
> 

